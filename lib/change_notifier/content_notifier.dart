import 'package:daily_coding/api/github.dart';
import 'package:daily_coding/config/config.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:daily_coding/model/file_model.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:yaml/yaml.dart';

class ContentNotifier extends ChangeNotifier {
  ContentNotifier() : _logger = Logger('seafile_notifier.dart');

  Logger _logger;
  String _markdownData = "";
  String _markdownCodeString = "";
  String _title = "";
  List<String> _tags = [];
  List<FileModel> _dailyCodinglist = [];
  List<FileModel> _twolanglist = [];
  List<FileModel> _dirs = [];
  List<FileModel> _files = [];
  ArticleItem _articleItem;
  bool _loading = false;
  CardItem _cardItem;
  List<CardItem> _cardList = [];

  String getMarkdownData() => _markdownData;
  String getMarkdownCodeString() => _markdownCodeString;
  String getTitle() => _title;
  ArticleItem getArticleItem() => _articleItem;
  List<String> getTags() => _tags;
  List<FileModel> getDailyCodinglist() => _dailyCodinglist;
  List<FileModel> getTwolanglist() => _twolanglist;
  List<FileModel> getDirs() => _dirs;
  List<FileModel> getFiles() => _files;
  bool getLoading() => _loading;
  CardItem getCardItem() => _cardItem;
  List<CardItem> getCardList() => _cardList;

  setCardItem(CardItem value) {
    _cardItem = value;
    notifyListeners();
  }

  setCardList(List<CardItem> value) {
    _cardList = value;
    notifyListeners();
  }

  setMarkdownData(String value) {
    _markdownData = value;
    notifyListeners();
  }

  setMarkdownCodeString(String value) {
    _markdownCodeString = value;
    notifyListeners();
  }

  setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  setArticleItem(ArticleItem value) {
    _articleItem = value;
    notifyListeners();
  }

  setTags(List<String> value) {
    _tags = value;
    notifyListeners();
  }

  setDailyCodinglist(List<FileModel> value) {
    _dailyCodinglist = value;
    notifyListeners();
  }

  setTwolanglist(List<FileModel> value) {
    _twolanglist = value;
    notifyListeners();
  }

  setDirs(List<FileModel> value) {
    _dirs = value;
    notifyListeners();
  }

  setFiles(List<FileModel> value) {
    _files = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  queryDailyCodingList() async {
    setLoading(true);
    try {
      final Map<String, List<FileModel>> res =
          await _queryRepoDir(Config.DAILY_CODING_PATH);
      setDailyCodinglist(res["newFiles"]);
      setFiles(res["newFiles"]);
      setDirs(res["newDirs"]);
      setLoading(false);
    } catch (e) {
      _logger.warning("查询编程日课dir list，发生错误：$e");
      setLoading(false);
    }
  }

  queryTwolangList() async {
    setLoading(true);
    try {
      final Map<String, List<FileModel>> res =
          await _queryRepoDir(Config.TWO_LANG_PATH);
      setTwolanglist(res["newFiles"]);
      setFiles(res["newFiles"]);
      setDirs(res["newDirs"]);
      setLoading(false);
    } catch (e) {
      _logger.warning("查询程序员2郎dir list，发生错误：$e");
      setLoading(false);
    }
  }

  Future<Map<String, List<FileModel>>> _queryRepoDir(String path) async {
    Response res = await GithubApi.queryRepoDir(path: path);

    if (res != null && res.statusCode == 200) {
      var data = res.data;
      if (data == null || data.length == 0) {
        // no data;
        return {"newFiles": [], "newDirs": []};
      }

      final List<FileModel> contents =
          data.map<FileModel>((json) => FileModel.fromJson(json)).toList();

      final List<FileModel> newFiles =
          contents.where((item) => item.type == 'file').toList();
      final List<FileModel> newDirs =
          contents.where((item) => item.type != 'file').toList();

      return {"newFiles": newFiles, "newDirs": newDirs};
    } else {
      return {"newFiles": [], "newDirs": []};
    }
  }

  Future<void> queryContentDetail(String url) async {
    setLoading(true);
    try {
      Response res = await GithubApi.queryContentDetail(url);

      if (res != null && res.statusCode == 200) {
        final String str = res.data;
        final List<String> dataList = str.split("---");
        final String yamlStr = dataList[1];
        final String content = dataList[2];
        var yamlData = loadYaml(yamlStr);
        // final String title = yamlData['title'];
        // final List<String> tags = yamlData['tags'];

        // setTitle(title);
        // setTags(tags);
        setMarkdownData(content);
      }

      setLoading(false);
    } catch (e) {
      _logger.warning("查询blog详情发生错误：$e");
      setLoading(false);
    }
  }

  Map<String, String> _exampleCode;
  String _code;

  Future<void> getExampleCode(context, String filePath) async {
    final String codeData = await getFile(context, filePath);
    setMarkdownCodeString(codeData);
  }

  Future<void> getContentMd(context, String filePath) async {
    final String codeData = await getFile(context, filePath);
    setMarkdownData(codeData);
  }

  Future<String> getFile(context, String filePath) async {
    if (_exampleCode == null) await _parseFile(context, filePath);
    return _code;
  }

  Future<void> _parseFile(context, String filePath) async {
    String code;
    try {
      code = await rootBundle.loadString(filePath);
    } catch (err) {
      Navigator.of(context).pop();
    }
    _code = code;
  }
}
