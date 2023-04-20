import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/tabs/completed_task_screen.dart';
import '../view/screens/tabs/favorite_task_screen.dart';
import '../view/screens/tabs/pending_task_screen.dart';
import '../view/widgets/add_task.dart';

class TabsController extends GetxController {
  RxInt tabIndex = 0.obs;



  setTabIndex(int val) {
    tabIndex.value = val;

  }

  List<Map<String, dynamic>> pageDetails = [
    {'pageName':  PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName':  CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName':  FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  void addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }
}
