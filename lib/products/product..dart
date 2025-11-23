import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  List todoList= [];
  final _myBox=Hive.box('MyBox');

  void crateInitialData(){
    todoList = [
      ['Make Tutorial', false],
      ['Code App', false],
    ];
  }
  void loadData(){
    todoList = _myBox.get('todolist');
  }
  void updateData(){
    _myBox.put('todolist', todoList);
  }
}