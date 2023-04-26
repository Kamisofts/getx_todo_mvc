import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controller/todo_controller.dart';
import '../../../core/model/todo_model.dart';
import '../../widgets/todo_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Chip(
              label: Text(
                '${controller.pendingTodos.length
                    .toString()} Pending | ${controller
                    .completedTodos.length.toString()}  Completed',
              ),
            ),
          ),
          TodosList(todoList: controller.pendingTodos)

        ],
      );
    });
  }
}
