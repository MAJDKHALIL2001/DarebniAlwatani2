import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/views/login_view/login_view.dart';
import 'package:darrebni_exam/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:darrebni_exam/app/my_app_controller.dart';
import 'package:darrebni_exam/core/data/repository/shared_prefrence_repository.dart';
import 'package:darrebni_exam/core/services/connectivity_service.dart';
import 'package:darrebni_exam/core/translation/app_translation.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';

import 'package:darrebni_exam/ui/views/splash_view/splash_view.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyAppController controller = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return StreamProvider(
      create: (BuildContext context) =>
          connectivityService.connectivityStatusController.stream,
      initialData: ConnectivityStatus.ONLINE,
      child: GetMaterialApp(
        locale: getLocal(),
        translations: AppTranslation(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: storege.getFirstLunch() ? SplashView() : SplashView(),
      ),
    );
  }
}

Locale getLocal() {
  String langCode = SharedPrefrenceRepository().getAppLanguge();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}



//Get.toNamed('/details');