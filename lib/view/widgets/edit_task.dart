import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/controller/todo_controller.dart';
import '../../model/todo_model.dart';

class EditTaskScreen extends GetWidget<TodoController> {
  final ModelTodo oldTask;

   const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController titleController =
    TextEditingController(text: oldTask.title);
    TextEditingController descController =
    TextEditingController(text: oldTask.description);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Edit Task', style: TextStyle(fontSize: 24)),
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
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    var editedTask = ModelTodo(
                        id: oldTask.id,
                        title: titleController.text,
                        isFavorite: oldTask.isFavorite,
                        isDone: false,
                        description: descController.text,
                        date: DateTime.now().toString(), status: '');
                   controller.editTaskOldNew(oldTask: oldTask,newTask: editedTask);
Get.back();                  },
                  child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
