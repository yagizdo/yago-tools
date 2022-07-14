import 'package:flutter/material.dart';
import 'package:yago_tools/constants/app_colors.dart';
import 'package:yago_tools/constants/app_strings.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:yago_tools/screens/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: appTitle,
        theme: AppTheme().appTheme,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        home: HomeView(),
      ),
    );
  }
}
