import 'package:daily_coding/app.dart';
import 'package:daily_coding/change_notifier/collect_notifier.dart';
import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/change_notifier/search_notifier.dart';
import 'package:daily_coding/change_notifier/settings_notifier.dart';
import 'package:daily_coding/routers/route_manager.dart';
import 'package:daily_coding/utils/local_storage.dart';
import 'package:daily_coding/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:stack_trace/stack_trace.dart';

void initLogger() {
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord.listen((LogRecord rec) {
    final List<Frame> frames = Trace.current().frames;
    try {
      final Frame f = frames.skip(0).firstWhere((Frame f) =>
          f.library.toLowerCase().contains(rec.loggerName.toLowerCase()) &&
          f != frames.first);
      print(
          '${rec.level.name}: ${f.member} (${rec.loggerName}:${f.line}): ${rec.message}');
    } catch (e) {
      print(e.toString());
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RouterManager.init();
  Network.init();
  await localStorageManager.init();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    initLogger();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CollectNotifier()),
          ChangeNotifierProvider(create: (_) => SettingsNotifier()),
          ChangeNotifierProvider(create: (_) => ContentNotifier()),
          ChangeNotifierProvider(create: (_) => SearchNotifier()),
        ],
        child: App(),
      ),
    );
  });
}
