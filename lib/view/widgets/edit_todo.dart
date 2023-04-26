import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controller/todo_controller.dart';
import '../../core/model/todo_model.dart';

class EditTodoScreen extends GetWidget<TodoController> {
  final ModelTodo oldTodo;

  const EditTodoScreen({Key? key, required this.oldTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTodo.title);
    TextEditingController descController =
        TextEditingController(text: oldTodo.description);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Edit Todo', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            maxLines: 5,
            minLines: 3,
            autofocus: true,
            controller: descController,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    var editedTodo = ModelTodo(
                        id: oldTodo.id,
                        title: titleController.text,
                        isFavorite: oldTodo.isFavorite,
                        isDone: 0,
                        description: descController.text,
                        date: DateTime.now().toString(),
                        status: '',
                        millis: DateTime.now().millisecondsSinceEpoch);
                    controller.editTodoOldNew(
                        oldTodo: oldTodo, newTodo: editedTodo);
                    Get.back();
                  },
                  child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
