import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => _todos;

  void addTodo(String task){
    if(task.isEmpty) return;
    _todos.add(task);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}