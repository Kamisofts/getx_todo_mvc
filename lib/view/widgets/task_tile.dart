import 'package:flutter/material.dart';
import 'package:getx_todo_mvc/view/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

import '../../model/todo_model.dart';



class TaskTile extends StatelessWidget {
  ModelTodo task;

  TaskTile({Key? key, required this.task}) : super(key: key);



  @override
  Widget build(BuildContext context) {

  return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          task.isFavorite == false
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
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat()
                            .add_yMMMd()
                            .format(DateTime.parse(task.date)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: task.isDone,
                      onChanged: task.isDeleted!
                          ? null
                          : (val) {
                          // todoProvider.updateTask(task: task);
                            },
                    ),
                    // PopUpMenu(
                    //   cancelOrDelete: () => todoProvider.removeOrDeleteTask(context,task),
                    //   task: task,
                    //   editTaskCallback: () => todoProvider.editTask(context,task),
                    //   likeOrDislike: () => todoProvider.markFavoriteOrUnFavoriteTask(task: task),
                    //   restoreTaskCallback: () =>todoProvider.restoreTask(task: task),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
}
