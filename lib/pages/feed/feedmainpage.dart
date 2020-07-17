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
                        child: ListTile(title: Text(detail.title)),
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
