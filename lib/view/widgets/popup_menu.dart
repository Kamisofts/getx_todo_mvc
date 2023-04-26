import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/model/todo_model.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu(
      {Key? key,
      required this.cancelOrDelete,
      required this.todo,
      required this.likeOrDislike,
      required this.restoreTodoCallback})
      : super(key: key);
  final VoidCallback cancelOrDelete;
  final VoidCallback likeOrDislike;
  final VoidCallback restoreTodoCallback;
  final ModelTodo todo;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => todo.isDeleted == 0
            ? [
                PopupMenuItem(
                  onTap:  likeOrDislike,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: todo.isFavorite == 0
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove_outlined),
                      label: todo.isFavorite == 0
                          ? const Text('Add to \nBookmark')
                          : const Text('Remove from \nBookmark')),
                ),
                PopupMenuItem(
                  onTap: cancelOrDelete,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                ),
              ]
            : [
                PopupMenuItem(
                  onTap: restoreTodoCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore')),
                ),
                PopupMenuItem(
                  onTap: cancelOrDelete,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever')),
                ),
              ]);
  }
}
