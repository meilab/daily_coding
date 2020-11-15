import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/cupertino.dart';

class CollectNotifier extends ChangeNotifier {
  List<ArticleItem> _items = <ArticleItem>[];

  List<ArticleItem> get articles => _items;

  setArticles(List<ArticleItem> items) {
    _items = items;
    notifyListeners();
  }
}
