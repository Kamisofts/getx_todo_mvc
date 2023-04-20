import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/controller/main_binding.dart';
import 'package:getx_todo_mvc/controller/theme_controller.dart';
import 'package:getx_todo_mvc/view/screens/tab_screen.dart';

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MainBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeController=Get.find<ThemeController>();
    return Obx(() =>
        GetMaterialApp(
          smartManagement: SmartManagement.full,
          debugShowCheckedModeBanner: false,
          title: 'Flutter GetX',
          initialBinding: MainBindings(),
          theme
          :themeController.switchValue.value
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          home: TabScreen(),
        ))

    ;
  }
}

