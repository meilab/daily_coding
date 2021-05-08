import 'dart:convert' show json;

T asT<T>(dynamic value) {
  return value;
}

class FeedEntity {
  FeedEntity({
    required this.s,
    required this.m,
    required this.d,
  });

  factory FeedEntity.fromJson(Map<String, dynamic> jsonRes) => FeedEntity(
        s: asT<int>(jsonRes['s']),
        m: asT<String>(jsonRes['m']),
        d: D.fromJson(asT<Map<String, dynamic>>(jsonRes['d'])),
      );

  int s;
  String m;
  D d;

  Map<String, dynamic> toJson() => <String, dynamic>{
        's': s,
        'm': m,
        'd': d,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class D {
  D({
    required this.total,
    required this.entrylist,
  });

  factory D.fromJson(Map<String, dynamic> jsonRes) {
    final List<EntryDetail>? entrylist =
        jsonRes['entrylist'] is List ? <EntryDetail>[] : null;
    if (entrylist != null) {
      for (final dynamic item in jsonRes['entrylist']) {
        if (item != null) {
          entrylist.add(EntryDetail.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }

      return D(
        total: asT<int>(jsonRes['total']),
        entrylist: entrylist,
      );
    } else {
      return D(total: 0, entrylist: []);
    }
  }

  int total;
  List<EntryDetail> entrylist;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total': total,
        'entrylist': entrylist,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class EntryDetail {
  EntryDetail({
    required this.collectionCount,
    required this.userRankIndex,
    required this.buildTime,
    required this.commentsCount,
    required this.gfw,
    required this.objectId,
    required this.checkStatus,
    required this.isEvent,
    required this.entryView,
    required this.subscribersCount,
    required this.ngxCachedTime,
    required this.verifyStatus,
    required this.tags,
    required this.updatedAt,
    required this.rankIndex,
    required this.hot,
    required this.autoPass,
    required this.originalUrl,
    required this.verifyCreatedAt,
    required this.createdAt,
    required this.user,
    required this.author,
    required this.screenshot,
    required this.original,
    required this.hotIndex,
    required this.content,
    required this.title,
    required this.lastCommentTime,
    required this.type,
    required this.english,
    required this.category,
    required this.viewsCount,
    required this.summaryInfo,
    required this.isCollected,
  });

  factory EntryDetail.fromJson(Map<String, dynamic> jsonRes) {
    final List<Tags> tags = jsonRes['tags'];

    for (final dynamic item in jsonRes['tags']) {
      if (item != null) {
        tags.add(Tags.fromJson(asT<Map<String, dynamic>>(item)));
      }
    }
    return EntryDetail(
      collectionCount: asT<int>(jsonRes['collectionCount']),
      userRankIndex: asT<double>(jsonRes['userRankIndex']),
      buildTime: asT<double>(jsonRes['buildTime']),
      commentsCount: asT<int>(jsonRes['commentsCount']),
      gfw: asT<bool>(jsonRes['gfw']),
      objectId: asT<String>(jsonRes['objectId']),
      checkStatus: asT<bool>(jsonRes['checkStatus']),
      isEvent: asT<bool>(jsonRes['isEvent']),
      entryView: asT<String>(jsonRes['entryView']),
      subscribersCount: asT<int>(jsonRes['subscribersCount']),
      ngxCachedTime: asT<int>(jsonRes['ngxCachedTime']),
      verifyStatus: asT<bool>(jsonRes['verifyStatus']),
      tags: tags,
      updatedAt: asT<String>(jsonRes['updatedAt']),
      rankIndex: asT<double>(jsonRes['rankIndex']),
      hot: asT<bool>(jsonRes['hot']),
      autoPass: asT<bool>(jsonRes['autoPass']),
      originalUrl: asT<String>(jsonRes['originalUrl']),
      verifyCreatedAt: asT<String>(jsonRes['verifyCreatedAt']),
      createdAt: asT<String>(jsonRes['createdAt']),
      user: User.fromJson(asT<Map<String, dynamic>>(jsonRes['user'])),
      author: asT<String>(jsonRes['author']),
      screenshot: asT<String>(jsonRes['screenshot']),
      original: asT<bool>(jsonRes['original']),
      hotIndex: asT<double>(jsonRes['hotIndex']),
      content: asT<String>(jsonRes['content']),
      title: asT<String>(jsonRes['title']),
      lastCommentTime: asT<String>(jsonRes['lastCommentTime']),
      type: asT<String>(jsonRes['type']),
      english: asT<bool>(jsonRes['english']),
      category:
          Category.fromJson(asT<Map<String, dynamic>>(jsonRes['category'])),
      viewsCount: asT<int>(jsonRes['viewsCount']),
      summaryInfo: asT<String>(jsonRes['summaryInfo']),
      isCollected: asT<bool>(jsonRes['isCollected']),
    );
  }

  int collectionCount;
  double userRankIndex;
  double buildTime;
  int commentsCount;
  bool gfw;
  String objectId;
  bool checkStatus;
  bool isEvent;
  String entryView;
  int subscribersCount;
  int ngxCachedTime;
  bool verifyStatus;
  List<Tags> tags;
  String updatedAt;
  double rankIndex;
  bool hot;
  bool autoPass;
  String originalUrl;
  String verifyCreatedAt;
  String createdAt;
  User user;
  String author;
  String screenshot;
  bool original;
  double hotIndex;
  String content;
  String title;
  String lastCommentTime;
  String type;
  bool english;
  Category category;
  int viewsCount;
  String summaryInfo;
  bool isCollected;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'collectionCount': collectionCount,
        'userRankIndex': userRankIndex,
        'buildTime': buildTime,
        'commentsCount': commentsCount,
        'gfw': gfw,
        'objectId': objectId,
        'checkStatus': checkStatus,
        'isEvent': isEvent,
        'entryView': entryView,
        'subscribersCount': subscribersCount,
        'ngxCachedTime': ngxCachedTime,
        'verifyStatus': verifyStatus,
        'tags': tags,
        'updatedAt': updatedAt,
        'rankIndex': rankIndex,
        'hot': hot,
        'autoPass': autoPass,
        'originalUrl': originalUrl,
        'verifyCreatedAt': verifyCreatedAt,
        'createdAt': createdAt,
        'user': user,
        'author': author,
        'screenshot': screenshot,
        'original': original,
        'hotIndex': hotIndex,
        'content': content,
        'title': title,
        'lastCommentTime': lastCommentTime,
        'type': type,
        'english': english,
        'category': category,
        'viewsCount': viewsCount,
        'summaryInfo': summaryInfo,
        'isCollected': isCollected,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tags {
  Tags({
    required this.ngxCachedTime,
    required this.ngxCached,
    required this.title,
    required this.id,
  });

  factory Tags.fromJson(Map<String, dynamic> jsonRes) => Tags(
        ngxCachedTime: asT<int>(jsonRes['ngxCachedTime']),
        ngxCached: asT<bool>(jsonRes['ngxCached']),
        title: asT<String>(jsonRes['title']),
        id: asT<String>(jsonRes['id']),
      );

  int ngxCachedTime;
  bool ngxCached;
  String title;
  String id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ngxCachedTime': ngxCachedTime,
        'ngxCached': ngxCached,
        'title': title,
        'id': id,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class User {
  User({
    required this.community,
    required this.collectedEntriesCount,
    required this.company,
    required this.followersCount,
    required this.followeesCount,
    required this.role,
    required this.postedPostsCount,
    required this.level,
    required this.isAuthor,
    required this.postedEntriesCount,
    required this.totalCommentsCount,
    required this.ngxCachedTime,
    required this.ngxCached,
    required this.viewedEntriesCount,
    required this.jobTitle,
    required this.subscribedTagsCount,
    required this.totalCollectionsCount,
    required this.username,
    required this.avatarLarge,
    required this.objectId,
  });

  factory User.fromJson(Map<String, dynamic> jsonRes) => User(
        community: asT<Object>(jsonRes['community']),
        collectedEntriesCount: asT<int>(jsonRes['collectedEntriesCount']),
        company: asT<String>(jsonRes['company']),
        followersCount: asT<int>(jsonRes['followersCount']),
        followeesCount: asT<int>(jsonRes['followeesCount']),
        role: asT<String>(jsonRes['role']),
        postedPostsCount: asT<int>(jsonRes['postedPostsCount']),
        level: asT<int>(jsonRes['level']),
        isAuthor: asT<bool>(jsonRes['isAuthor']),
        postedEntriesCount: asT<int>(jsonRes['postedEntriesCount']),
        totalCommentsCount: asT<int>(jsonRes['totalCommentsCount']),
        ngxCachedTime: asT<int>(jsonRes['ngxCachedTime']),
        ngxCached: asT<bool>(jsonRes['ngxCached']),
        viewedEntriesCount: asT<int>(jsonRes['viewedEntriesCount']),
        jobTitle: asT<String>(jsonRes['jobTitle']),
        subscribedTagsCount: asT<int>(jsonRes['subscribedTagsCount']),
        totalCollectionsCount: asT<int>(jsonRes['totalCollectionsCount']),
        username: asT<String>(jsonRes['username']),
        avatarLarge: asT<String>(jsonRes['avatarLarge']),
        objectId: asT<String>(jsonRes['objectId']),
      );

  Object community;
  int collectedEntriesCount;
  String company;
  int followersCount;
  int followeesCount;
  String role;
  int postedPostsCount;
  int level;
  bool isAuthor;
  int postedEntriesCount;
  int totalCommentsCount;
  int ngxCachedTime;
  bool ngxCached;
  int viewedEntriesCount;
  String jobTitle;
  int subscribedTagsCount;
  int totalCollectionsCount;
  String username;
  String avatarLarge;
  String objectId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'community': community,
        'collectedEntriesCount': collectedEntriesCount,
        'company': company,
        'followersCount': followersCount,
        'followeesCount': followeesCount,
        'role': role,
        'postedPostsCount': postedPostsCount,
        'level': level,
        'isAuthor': isAuthor,
        'postedEntriesCount': postedEntriesCount,
        'totalCommentsCount': totalCommentsCount,
        'ngxCachedTime': ngxCachedTime,
        'ngxCached': ngxCached,
        'viewedEntriesCount': viewedEntriesCount,
        'jobTitle': jobTitle,
        'subscribedTagsCount': subscribedTagsCount,
        'totalCollectionsCount': totalCollectionsCount,
        'username': username,
        'avatarLarge': avatarLarge,
        'objectId': objectId,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Category {
  Category({
    required this.ngxCached,
    required this.title,
    required this.id,
    required this.name,
    required this.ngxCachedTime,
  });

  factory Category.fromJson(Map<String, dynamic> jsonRes) => Category(
        ngxCached: asT<bool>(jsonRes['ngxCached']),
        title: asT<String>(jsonRes['title']),
        id: asT<String>(jsonRes['id']),
        name: asT<String>(jsonRes['name']),
        ngxCachedTime: asT<int>(jsonRes['ngxCachedTime']),
      );

  bool ngxCached;
  String title;
  String id;
  String name;
  int ngxCachedTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ngxCached': ngxCached,
        'title': title,
        'id': id,
        'name': name,
        'ngxCachedTime': ngxCachedTime,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
