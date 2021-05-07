import 'dart:collection';
import 'dart:ui';

import 'package:daily_coding/change_notifier/search_notifier.dart';
import 'package:daily_coding/constants/constants.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/pages/search/searchpageitem.dart';
import 'package:provider/provider.dart';

class SearchMainPage extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchMainPage> {
  TextEditingController _controller = TextEditingController();
  String input = '';
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        input = _controller.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textList = [];
    // SearchStrategy是搜索关键词匹配策略，
    // 也可以用searchSimilarWords匹配相似单词，用searchWordsInTrie匹配前缀，自己设定参数
    final SearchNotifier searchNotifier = Provider.of<SearchNotifier>(context);
    HashMap<String, ArticleItem> searchMap = searchNotifier.getSearchMap();
    Set<String> result =
        searchNotifier.multiPositionSearchStrategy(input.split(KEY_SPLIT));
    bufferTitle = [];
    result.forEach((item) {
      if (searchMap[item] != null) {
        SearchPageListItem textItem = SearchPageListItem(searchMap[item]!);
        textList.add(textItem);
      }
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin:
            EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getSearchBar(context),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: textList.length,
                  itemBuilder: (context, position) {
                    return textList[position];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSearchBar(contextt) {
    return Container(
      child: Row(
        children: <Widget>[
          BackButton(),
          Expanded(
            child: Container(
              height: 48,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'search with keyword',
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      controller: _controller,
                    ),
                  ),
                  Visibility(
                    visible: _controller.text.length > 0,
                    child: GestureDetector(
                      child: Icon(
                        Icons.clear,
                      ),
                      onTap: () {
                        _controller.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Hero(
              tag: 'search',
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //多个关键字可能会出现重复的articleItem，用这个list去掉重复的title保证articleItem的唯一性
  List<String> bufferTitle = [];
}
