import 'package:flutter/material.dart';
import 'package:getx_todo_mvc/view/widgets/todo_tile.dart';
import '../../core/model/todo_model.dart';


class TodosList extends StatelessWidget {
  const TodosList({Key? key, required this.todoList}) : super(key: key);
  final List<ModelTodo> todoList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: todoList
              .map((todo) => ExpansionPanelRadio(
                    value: todo.id,
                    headerBuilder: (context, isOen) => TodoTile(
                      todo: todo,
                    ),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(children: [
                          const TextSpan(
                            text: 'Todo\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: todo.title,
                            style: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          const TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: todo.description,
                            style: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }


}
