import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controller/todo_controller.dart';
import '../widgets/todo_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () => controller.deleteAllTodo(),
                icon: const Icon(Icons.delete_forever_outlined),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${controller.removedTodos.length} Todos:',
                  ),
                ),
              ),
              TodosList(todoList: controller.removedTodos)

            ],
          ),

        );
      },
    );
  }
}


