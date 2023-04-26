import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_mvc/core/controller/todo_controller.dart';
import 'package:getx_todo_mvc/view/screens/tab_screen.dart';

import 'core/controller/main_binding.dart';
import 'core/controller/theme_controller.dart';
import 'core/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MainBindings().dependencies();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeController=Get.find<ThemeController>();
    Get.find<TodoController>().getTodos();
    themeController.getTheme();
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
          home: const TabScreen(),
        ))

    ;
  }
}

