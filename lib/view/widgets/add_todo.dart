import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controller/todo_controller.dart';
import '../../core/model/todo_model.dart';
import '../../core/utils/guid_gen.dart';

class AddTodoScreen extends GetWidget<TodoController> {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Add Todo', style: TextStyle(fontSize: 24)),
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
                    var todo = ModelTodo(
                        id: GUIDGen.generate(),
                        title: titleController.text,
                        description: descController.text,
                        date: DateTime.now().toString(),
                        status: '',
                        millis: DateTime.now().millisecondsSinceEpoch);
                    controller.addTodo(todo: todo);
                    Get.back();
                  },
                  child: const Text('Add')),
            ],
          )
        ],
      ),
    );
  }
}
