import 'package:daily_coding/config/config.dart';
import 'package:daily_coding/utils/network.dart';
import 'package:dio/dio.dart';

///仓库内容数据 get
reposData(reposOwner, repos) {
  return "${Config.GITHUB_HOST}repos/$reposOwner/$repos/contents";
}

///仓库路径下的内容 get
reposDataDir(reposOwner, repos, path, [branch = 'master']) {
  return "${Config.GITHUB_HOST}repos/$reposOwner/$repos/contents/$path" +
      ((branch == null) ? "" : ("?ref=" + branch));
}

class GithubApi {
  static queryRepoDir(
      {path = '', branch = "master", text = false, isHtml = false}) async {
    final String url = reposDataDir(
        Config.GITHUB_USER_NAME, Config.GITHUB_REPO_NAME, path, branch);
    Map<String, dynamic> headers = isHtml
        ? {"Accept": 'application/vnd.github.html'}
        : {"Accept": 'application/vnd.github.VERSION.raw'};
    final String contentType = text ? "application/text" : "application/json";

    Options options = Options(headers: headers, contentType: contentType);
    Response response = await Network.dio.get(url, options: options);
    return response;
  }

  static queryContentDetail(url) async {
    Response response = await Network.dio.get(url);
    return response;
  }
}
