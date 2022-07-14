import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yago_tools/localizations/codegen_loader.g.dart';

import 'app.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // env
  await dotenv.load(fileName: ".env");

  // Locator setup
  setup();

  // Run app
  runApp(
    EasyLocalization(
      path: 'lib/localizations',
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}
