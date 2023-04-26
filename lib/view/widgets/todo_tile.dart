import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/core/controller/tabs_controller.dart';
import 'package:getx_todo_mvc/core/controller/todo_controller.dart';
import 'package:getx_todo_mvc/view/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

import '../../core/model/todo_model.dart';

class TodoTile extends StatelessWidget {
  final ModelTodo todo;

  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          todo.isFavorite == 0
              ? const Icon(Icons.star_border_outlined)
              : const Icon(Icons.star_rounded),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: todo.isDone == 1
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat()
                            .add_yMMMd()
                            .format(DateTime.parse(todo.date)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GetBuilder<TodoController>(builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Checkbox(
                        value: todo.isDone == 1,
                        onChanged: todo.isDeleted == 1
                            ? null
                            : (val) {
                                ModelTodo newTodo =
                                    todo.copyWith(isDone: val! ? 1 : 0);
                                controller.updateTodo(todo: newTodo);
                              },
                      ),   GestureDetector(
                        onTap: () =>Get.find<TabsController>().editTodo(context, todo),
                        child: const Icon(Icons.edit),
                      ),
                      PopUpMenu(
                        cancelOrDelete: () =>
                            controller.removeOrDeleteTodo(context, todo),
                        todo: todo,

                        likeOrDislike: () =>
                            controller.markFavoriteOrUnFavoriteTodo(todo: todo),
                        restoreTodoCallback: () =>
                            controller.restoreTodo(todo: todo),
                      )
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
