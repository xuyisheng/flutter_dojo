import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteWidget extends StatefulWidget {
  @override
  _SqfliteWidgetState createState() => _SqfliteWidgetState();
}

class _SqfliteWidgetState extends State<SqfliteWidget> {
  String show = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(show),
        Row(
          children: <Widget>[
            Expanded(child: Text('Insert a Student')),
            RaisedButton(
              onPressed: () {
                final student = Student(1, 'XuYisheng', 18);
                insertStudent(student);
              },
              child: Text('Insert'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: Text('Query in DB')),
            RaisedButton(
              onPressed: () => setState(() {
                queryStudents().then((list) {
                  String str = '';
                  list.forEach((value) {
                    str += value.toString();
                  });
                  show = str;
                });
              }),
              child: Text('Query'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Update a Student\'s name'),
            Expanded(
              child: TextField(
                controller: controller,
              ),
            ),
            RaisedButton(
              onPressed: () {
                updateStudent(Student(1, controller.text, 18));
              },
              child: Text('Update'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: Text('Delete data')),
            RaisedButton(
              onPressed: () {
                deleteStudent(1);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ],
    );
  }
}

/// 打开Database
Future<Database> openDB() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'test_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    version: 1,
  );
  return database;
}

/// 插入数据
Future<void> insertStudent(Student student) async {
  final Database db = await openDB();
  await db.insert(
    'students',
    student.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

/// 查询数据
Future<List<Student>> queryStudents() async {
  final Database db = await openDB();
  final List<Map<String, dynamic>> maps = await db.query('students');
  return List.generate(maps.length, (i) {
    return Student(
      maps[i]['id'],
      maps[i]['name'],
      maps[i]['age'],
    );
  });
}

/// 更新数据
Future<void> updateStudent(Student student) async {
  // Get a reference to the database.
  final db = await openDB();
  await db.update(
    'students',
    student.toMap(),
    where: "id = ?",
    whereArgs: [student.id],
  );
}

/// 删除数据
Future<void> deleteStudent(int id) async {
  final db = await openDB();
  await db.delete(
    'students',
    where: "id = ?",
    whereArgs: [id],
  );
}

class Student {
  final int id;
  final String name;
  final int age;

  Student(this.id, this.name, this.age);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  @override
  String toString() {
    return 'id $id name $name age $age';
  }
}
