import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/view/screens/recycle_bin.dart';
import 'package:getx_todo_mvc/view/screens/tab_screen.dart';

import '../../core/controller/theme_controller.dart';
import '../../core/controller/todo_controller.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  ThemeController themeController = Get.find<ThemeController>();
  TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(

            onTap: () =>Get.to(()=>TabScreen()),
            child: ListTile(
              title: const Text('My Tasks'),
              leading: const Icon(Icons.folder_special),
              trailing: Obx(() => Text(
                  '${todoController.pendingTodos.length} | ${todoController.completedTodos.length}')),
            ),
          ),
          GestureDetector(

            onTap: () =>Get.to(()=>RecycleBin()),
            child: ListTile(
              title: const Text('Bin'),
              leading: const Icon(Icons.delete),
              trailing: Obx(() => Text(todoController.removedTodos.length.toString())),
            ),
          ),
          Obx(() => ListTile(
                title: Text(themeController.switchValue.value
                    ? 'Dark Theme'
                    : 'Light Theme'),
                trailing: Switch(
                    value: themeController.switchValue.value,
                    onChanged: (val) => themeController.onEventSwitch(val)),
              ))
        ]),
      ),
    );
  }
}
