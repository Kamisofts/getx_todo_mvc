import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_mvc/core/services/sqlite_database.dart';
import 'package:getx_todo_mvc/view/widgets/add_todo.dart';

import '../../view/widgets/edit_todo.dart';
import '../model/todo_model.dart';

class TodoController extends GetxController{

  DatabaseHelper dbHelper=DatabaseHelper();

  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  var removedTodos   = <ModelTodo>[].obs;
  var pendingTodos   = <ModelTodo>[].obs;
  var completedTodos = <ModelTodo>[].obs;
  var favoriteTodos  = <ModelTodo>[].obs;
  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
 /// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))


  void removeOrDeleteTodo(BuildContext ctx, ModelTodo todo) {
    todo.isDeleted==1 ? deleteTodo(todo: todo) : removeTodo(todo: todo);
  }



  Future<void> getTodos() async {
    dbHelper=DatabaseHelper();
    var results=await dbHelper.getAllTodos();
    removedTodos.clear();
    pendingTodos.clear();
    completedTodos.clear();
    favoriteTodos.clear();

    for (var element in results) {
      if(element.isFavorite==1){
        favoriteTodos.add(element);
      }else  if(element.isDeleted==1){
        removedTodos.add(element);
      }else  if(element.isDone==1){
        completedTodos.add(element);
      }else{
        pendingTodos.add(element);
      }
    }

  update();
  }
  Future<void> addTodo({required ModelTodo todo}) async {

    dbHelper=DatabaseHelper();
    int results=await dbHelper.insertTodos(todo);
    print('Inserted : $results');
    getTodos();
  }

  Future<void> updateTodo({required ModelTodo todo}) async {

    bool results=await dbHelper.updateTodos(todo);
    print('Updated : $results');
    getTodos();

  }

  markFavoriteOrUnFavoriteTodo({required ModelTodo todo}) {
print('Called');
    int fav=todo.isFavorite==0?1:0;
    print('${todo.isFavorite} : $fav');
    ModelTodo newTodo=todo.copyWith(isFavorite: fav);
    updateTodo(todo: newTodo);

  }

  restoreTodo({required ModelTodo todo}) {
    ModelTodo newTodo=todo.copyWith(isDeleted: 0);
    updateTodo(todo: newTodo);
  }

  deleteTodo({required ModelTodo todo}) async {

    await dbHelper.deleteSingleTodos(todo.id);
    getTodos();

  }
  deleteAllTodo() async {

    await dbHelper.deleteAllTodos();
    getTodos();
  }

  removeTodo({required ModelTodo todo}) {
    ModelTodo newTodo=todo.copyWith(isDeleted: 1);
    updateTodo(todo: newTodo);
  }
  void editTodoOldNew(
      {required ModelTodo oldTodo, required ModelTodo newTodo}) {
    updateTodo(todo: newTodo);

  }

  editTodo(BuildContext context, ModelTodo todo) {
    Get.defaultDialog(
        title: 'DialogBox',
        content: Text('Are you sure?'),
        backgroundColor: Colors.white70,
        textCancel: 'No',
        textConfirm: "Yes",
        cancelTextColor: Colors.redAccent,
        confirmTextColor: Colors.lightBlueAccent,
        onCancel: () {},
        onConfirm: () {},
        barrierDismissible: false);
  }
/// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))

}