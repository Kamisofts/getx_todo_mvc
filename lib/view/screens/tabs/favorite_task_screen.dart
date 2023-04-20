import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/todo_controller.dart';
import '../../../model/todo_model.dart';
import '../../widgets/task_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
   FavoriteTasksScreen({Key? key}) : super(key: key);
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {

            List<ModelTodo> todoList =[];// todoProvider.favoriteTasks;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: Chip(
                    label: Text(
                      '${todoController.favoriteTasks.length.toString()} Favorites',
                    ),
                  ),
                ),
                Obx(() => TasksList(taskList: todoList))

              ],
            );


  }
}
