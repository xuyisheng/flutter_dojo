import 'package:flutter/material.dart';

class SearchListWidget extends StatefulWidget {
  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  final initList = List<String>.generate(10000, (i) => "Search Item $i");
  TextEditingController editingController = TextEditingController();
  var showItemList = List<String>();

  @override
  void initState() {
    showItemList.addAll(initList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: editingController,
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            filterSearch(value);
          },
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: showItemList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${showItemList[index]}'),
              );
            },
          ),
        ),
      ],
    );
  }

  filterSearch(String query) {
    List<String> searchList = List<String>();
    searchList.addAll(initList);
    if (query.isNotEmpty) {
      List<String> resultListData = List<String>();
      searchList.forEach((item) {
        if (item.contains(query)) {
          resultListData.add(item);
        }
      });
      setState(() {
        showItemList.clear();
        showItemList.addAll(resultListData);
      });
      return;
    } else {
      setState(() {
        showItemList.clear();
        showItemList.addAll(initList);
      });
    }
  }
}
