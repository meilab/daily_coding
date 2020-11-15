import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/theme/metrics.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/widgets/syntax_high_lighter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RenderCodeWidget extends StatefulWidget {
  RenderCodeWidget();

  @override
  _RenderCodeWidgetState createState() => _RenderCodeWidgetState();
}

class _RenderCodeWidgetState extends State<RenderCodeWidget> {
  @override
  Widget build(BuildContext context) {
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context);

    String _markdownCodeString =
        contentNotifier.getMarkdownCodeString() ?? 'Example code not found';

    Widget mdCode;

    try {
      String showSource = _markdownCodeString.replaceAll("&lt;", "<");
      showSource = showSource.replaceAll("&gt;", ">");
      mdCode = Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontFamily: 'monospace', fontSize: 16.0),
            children: <TextSpan>[DartSyntaxHighlighter().format(showSource)],
          ),
        ),
      );
    } catch (err) {
      mdCode = Text(_markdownCodeString ??= '');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).demoCode()),
        actions: [
          IconButton(
              icon: Icon(Icons.copy),
              tooltip: MyLocalizations.of(context).click2Copy(),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _markdownCodeString));
                if (isMobile) {
                  Fluttertoast.showToast(
                      msg: MyLocalizations.of(context).copyFinished(),
                      fontSize: 64,
                      gravity: ToastGravity.CENTER);
                }
              }),
        ],
      ),
      body: _markdownCodeString == null
          ? Center(
              child: Text('Not found'),
            )
          : Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 800,
                  ),
                  padding: const EdgeInsets.all(MyMetrics.doubleBaseMargin),
                  child: SingleChildScrollView(
                    child: mdCode,
                  ),
                ),
              ),
            ),
    );
  }
}
