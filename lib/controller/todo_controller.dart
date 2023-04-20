import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/todo_model.dart';
import '../view/widgets/edit_task.dart';

class TodoController extends GetxController{


  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  var removedTasks = <ModelTodo>[].obs;
  var pendingTasks = <ModelTodo>[].obs;
  var completedTasks = <ModelTodo>[].obs;
  var favoriteTasks = <ModelTodo>[].obs;
  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
 /// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))


  void removeOrDeleteTask(BuildContext ctx, ModelTodo task) {
    task.isDeleted! ? deleteTask(task: task) : removeTask(task: task);
  }

  void editTask(BuildContext context, ModelTodo task) {
    Navigator.of(context).pop();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: EditTaskScreen(oldTask: task),
          ),
        ));
  }

  void addTask({required ModelTodo task}) {
  }

  void updateTask({required ModelTodo task}) {}

  markFavoriteOrUnFavoriteTask({required ModelTodo task}) {}

  restoreTask({required ModelTodo task}) {}

  deleteTask({required ModelTodo task}) {}
  deleteAllTask() {}

  removeTask({required ModelTodo task}) {}
  void editTaskOldNew(
      {required ModelTodo oldTask, required ModelTodo newTask}) {}
/// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))

}