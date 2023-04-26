// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controller/tabs_controller.dart';
import 'my_drawer.dart';

class TabScreen extends GetWidget<TabsController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
                controller.pageDetails[controller.tabIndex.value]['title']),
            actions: [
              IconButton(
                onPressed: () => controller.addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: controller.pageDetails[controller.tabIndex.value]
                  ['pageName']),
          floatingActionButton: controller.tabIndex.value == 0
              ? FloatingActionButton(
                  onPressed: () => controller.addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                )
              : null,
          bottomNavigationBar:  BottomNavigationBar(
                currentIndex: controller.tabIndex.value,
                onTap: (index) => controller.setTabIndex(index),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.incomplete_circle_rounded),
                      label: 'Pending Task'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done), label: 'Completed Task'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorite Task')
                ],
              ),
        ));
  }
}
