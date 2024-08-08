import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/constants/app_information.dart';
import 'app/routes/app_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

Future<void> initializeApp() async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      name: "Damdex",
      options: const FirebaseOptions(
        apiKey: "AIzaSyBYm3UqgTYr0KUx3D8Efvih0Dygv5c8RNM",
        appId: "1:702459171800:android:4cfb5eed3187826eda18ad",
        messagingSenderId: "702459171800",
        projectId: "damdex-apps",
        storageBucket: "damdex-apps.appspot.com",
      ),
    );
  } else {}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      getPages: AppPages.routes,
      title: AppInformation.title,
      initialBinding: AppBindings(),
      theme: AppTheme.defaultTheme,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(physics: const ClampingScrollPhysics()),
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
