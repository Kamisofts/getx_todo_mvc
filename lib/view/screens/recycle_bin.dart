import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/todo_controller.dart';
import '../widgets/task_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
   RecycleBin({Key? key}) : super(key: key);

  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () =>todoController.deleteAllTask(),
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
                    '${todoController.removedTasks.length} Tasks:',
                  ),
                ),
              ),
              Obx(() => TasksList(taskList: todoController.removedTasks ))

            ],
          ),

        );

  }
}


