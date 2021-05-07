import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/utils/local_storage.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/widgets/render_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class BaseWidget extends StatefulWidget {
  final String title;
  final Widget widget;

  BaseWidget(this.title, this.widget);

  @override
  _BaseWidgetState createState() {
    return _BaseWidgetState();
  }
}

class _BaseWidgetState extends State<BaseWidget> {
  List<String> collects = [];
  bool collected = false;

  @override
  Widget build(BuildContext context) {
    collects = List<String>.from(localStorageManager.getStringList('collects'));
    collected = collects.indexWhere((element) => element == widget.title) != -1;
    final mediaQuery = MediaQuery.of(context);
    final contentHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        kToolbarHeight;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, '');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE6EBEB),
          elevation: 0,
          leading: IconButton(
            icon: const BackButtonIcon(),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.maybePop(context, null);
            },
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(collected ? Icons.star : Icons.star_border),
              color: Colors.black54,
              tooltip: MyLocalizations.of(context)!.collect(),
              onPressed: () {
                if (mounted) {
                  setState(() {
                    if (collected) {
                      collects.remove(widget.title);
                    } else {
                      collects.add(widget.title);
                    }
                    localStorageManager.putStringList('collects', collects);
                  });
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.code),
              color: Colors.black54,
              tooltip: MyLocalizations.of(context)!.reviewCode(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RenderCodeWidget(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.copy),
              color: Colors.black54,
              tooltip: MyLocalizations.of(context)!.click2Copy(),
              onPressed: () {
                final ContentNotifier contentNotifier =
                    Provider.of<ContentNotifier>(context, listen: false);
                var shareText = contentNotifier.getMarkdownCodeString();
                Clipboard.setData(ClipboardData(text: shareText));
                if (isMobile) {
                  Fluttertoast.showToast(
                      msg: "已复制到剪切板",
                      fontSize: 64,
                      gravity: ToastGravity.CENTER);
                }
              },
            ),
            if (isMobile)
              IconButton(
                icon: Icon(Icons.share),
                color: Colors.black54,
                onPressed: () {
                  final ContentNotifier contentNotifier =
                      Provider.of<ContentNotifier>(context, listen: false);
                  var shareText = contentNotifier.getMarkdownCodeString();
                  Share.share(shareText);
                },
              ),
          ],
        ),
        body: Container(
          color: Color(0xFFE6EBEB),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          height: contentHeight,
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
              bottom: Radius.circular(2.0),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(widget.title),
              ),
              body: Container(
                margin: EdgeInsets.all(16),
                child: widget.widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
