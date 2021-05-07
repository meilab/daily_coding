import 'dart:async';

import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/pages/feed/feed_entity.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedDetailPage extends StatefulWidget {
  final EntryDetail article;

  const FeedDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  _FeedDetailPageState createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  late WebViewController _webViewController;
  Completer<bool> _finishedCompleter = Completer();

  ValueNotifier canGoBack = ValueNotifier(false);
  ValueNotifier canGoForward = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            FutureBuilder<bool>(
              future: _finishedCompleter.future,
              initialData: false,
              builder: (context, snapshot) => (snapshot.data != null)
                  ? SizedBox.shrink()
                  : Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        strokeWidth: 2,
                      ),
                    ),
            ),
            SizedBox(width: 16),
            Expanded(child: Text(MyLocalizations.of(context)!.detail())),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => Share.share(widget.article.originalUrl),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: WebView(
          initialUrl: widget.article.originalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (!request.url.startsWith('http')) {
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
          onWebViewCreated: (WebViewController controller) =>
              _webViewController = controller,
          onPageFinished: (String value) {
            if (!_finishedCompleter.isCompleted) {
              _finishedCompleter.complete(true);
            }
            refreshNavigator();
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: canGoBack,
              builder: (BuildContext context, dynamic value, Widget? child) =>
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: !value
                          ? null
                          : () {
                              _webViewController.goBack();
                              refreshNavigator();
                            }),
            ),
            ValueListenableBuilder(
              valueListenable: canGoForward,
              builder: (BuildContext context, dynamic value, Widget? child) =>
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: !value
                          ? null
                          : () {
                              _webViewController.goForward();
                              refreshNavigator();
                            }),
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () => _webViewController.reload(),
            ),
          ],
        ),
      ),
    );
  }

  void refreshNavigator() {
    _webViewController.canGoBack().then((value) => canGoBack.value = value);
    _webViewController
        .canGoForward()
        .then((value) => canGoForward.value = value);
  }
}
