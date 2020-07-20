import 'package:flutter/material.dart';
import 'package:flutter_dojo/pages/feed/feed_entity.dart';
import 'package:flutter_dojo/pages/feed/feeddetailpage.dart';
import 'package:flutter_dojo/pages/feed/restclient.dart';
import 'package:provider/provider.dart';

class FeedMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedListViewModel>(
      create: (BuildContext context) {
        var feedListViewModel = FeedListViewModel();
        feedListViewModel.getFlutterFeedList();
        return feedListViewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Feed'),
        ),
        body: Consumer<FeedListViewModel>(
          builder: (BuildContext context, FeedListViewModel value, Widget child) {
            var feedList = value.feedList;
            return feedList.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == feedList.length) {
                        value.getFlutterFeedList();
                        return Center(child: CircularProgressIndicator());
                      }
                      var detail = feedList[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedDetailPage(article: detail))),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    detail.screenshot.isEmpty
                                        ? Image.asset(
                                            'images/book.jpg',
                                            width: 60,
                                            height: 80,
                                          )
                                        : Image.network(
                                            '${detail.screenshot}',
                                            width: 60,
                                            height: 80,
                                          ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              '${detail.title}',
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              '${detail.summaryInfo}',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage('${detail.user.avatarLarge}'),
                                      ),
                                      SizedBox(width: 24),
                                      Text(
                                        '${detail.user.username}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(width: 24),
                                      Text(
                                        '${detail.createdAt}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: feedList.length + 1,
                  );
          },
        ),
      ),
    );
  }
}

class FeedListViewModel with ChangeNotifier {
  List<EntryDetail> feedList = List();
  int pageIndex = 0;

  void getFlutterFeedList() async {
    var feedEntity = await client.getTagDataList('web', '5a96291f6fb9a0535b535438', pageIndex, 20, 'createdAt');
    var list = feedEntity.d.entrylist;
    if (list.length > 0) {
      pageIndex++;
      feedList.addAll(list);
    }
    notifyListeners();
  }
}
