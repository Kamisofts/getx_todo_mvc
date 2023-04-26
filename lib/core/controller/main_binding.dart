import 'package:get/get.dart';
import 'package:getx_todo_mvc/core/controller/tabs_controller.dart';
import 'package:getx_todo_mvc/core/controller/theme_controller.dart';
import 'package:getx_todo_mvc/core/controller/todo_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {

    // Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut(() => TabsController(),fenix: true);
    Get.lazyPut(() => TodoController(),fenix: true);
    Get.lazyPut(() => ThemeController(),fenix: true);
  }

}