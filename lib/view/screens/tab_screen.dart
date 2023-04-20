// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/controller/tabs_controller.dart';
import 'my_drawer.dart';

class TabScreen extends StatelessWidget {
  TabScreen({Key? key}) : super(key: key);
  final TabsController tabController = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            tabController.pageDetails[tabController.tabIndex.value]['title']))

       ,
        actions: [
          IconButton(
            onPressed: () => tabController.addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer:  MyDrawer(),
      body: Obx(() =>
          tabController.pageDetails[tabController.tabIndex.value]['pageName']),
      floatingActionButton: tabController.tabIndex.value == 0
          ? FloatingActionButton(
              onPressed: () => tabController.addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar:
      Obx(() => BottomNavigationBar(
        currentIndex: tabController.tabIndex.value,
        onTap: (index) => tabController.setTabIndex(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_rounded),
              label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task')
        ],
      ))
      ,
    );
  }
}
