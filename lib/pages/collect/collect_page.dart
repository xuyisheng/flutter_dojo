
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/common/sp_util.dart';
import 'package:flutter_dojo/pages/collect/collect_provider.dart';
import 'package:provider/provider.dart';

class CollectPage extends StatefulWidget{

  @override
  _CollectPageState createState() {
    return _CollectPageState();
  }

}

class _CollectPageState extends State<CollectPage>{

  List<DemoItem> collectDemos = <DemoItem>[];

  void _refresh(){
    List<String> strs = SpUtil.getStringList('collects');
    List<DemoItem> demos = Provider.of<CollectProvider>(context,listen: false).demos;
    collectDemos.clear();
    strs.forEach((element) {
      int index = demos.indexWhere((d) => d.title == element);
      if (index != -1){
        collectDemos.add(demos[index]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏夹'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (_,__) => const SizedBox(height: 6.0,),
                itemBuilder: (_,index){
                  var demoItem = collectDemos[index];
                  return Material(
                    borderRadius: BorderRadius.circular(16.0),
                    elevation: 1.0,
                    shadowColor: Colors.white54,
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0)
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child:  Row(
                          children: <Widget>[
                            CircleAvatar(
                              child: Icon(demoItem.icon),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    demoItem.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 100, 100, 135),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.forward,
                                        color: Color.fromARGB(255, 100, 100, 135),
                                      ),
                                      Expanded(
                                        child: Text(
                                          demoItem.subtitle,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 100, 100, 135),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: demoItem.buildRoute),
                        ).then((value){
                          setState(() {
                            _refresh();
                          });
                        });
                      },
                    ),
                  );
                },
                itemCount: collectDemos.length,
              ),
            )
          ],
        ),
      ),
    );
  }

}