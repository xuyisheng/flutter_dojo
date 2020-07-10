import 'package:flutter_dojo/category/backend/dio.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json['code'],
      message: json['message'],
      data: EntityFactory.generateOBJ<T>(json['data']),
    );
  }
}

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else if (T.toString() == 'TestEntity') {
      return TestEntity.fromJson(json) as T;
    } else {
      return json as T;
    }
  }
}

class ErrorEntity {
  int code;
  String message;

  ErrorEntity({this.code, this.message});
}
