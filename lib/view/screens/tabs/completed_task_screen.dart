import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/todo_controller.dart';
import '../../../model/todo_model.dart';
import '../../widgets/task_list.dart';

class CompletedTasksScreen extends StatelessWidget {
   CompletedTasksScreen({Key? key}) : super(key: key);
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {

            List<ModelTodo> todoList =[];// todoProvider.completedTasks;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: Chip(
                    label: Text(
                      '${todoController.pendingTasks.length.toString()} Pending | ${todoController
                          .completedTasks.length.toString()}  Completed',
                    ),
                  ),
                ),
                Obx(() => TasksList(taskList: todoList))

              ],
            );

  }
}
