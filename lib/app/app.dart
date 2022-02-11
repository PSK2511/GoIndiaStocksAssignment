import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/app/app_binding.dart';
import 'package:stocks/app/data/values/constants.dart';
import 'package:stocks/app/data/values/env.dart';
import 'package:stocks/app/routes/app_pages.dart';
import 'package:stocks/app/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.title,
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
