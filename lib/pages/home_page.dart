import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/products/product..dart';
import 'package:todolist/util/dialog_box.dart';
import '../util/todo_title.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('MyBox');
  toDoDatabase db = toDoDatabase();
  //hàm này chạy đầu tiên khi người đùng mở app
  void initState(){
    if (_myBox.get('todolist')==null){
      db.crateInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }
  // check box task
  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }
  // save new task
  void saveNewTask(){
    setState(() {
      //add new task to list
      db.todoList.add([_controller.text,false]);
      // clear textfiled
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    //db.updateData();
  }
  // delect task
  void delectTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('To Do'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            delectFunction: (context)=> delectTask(index),
          );
        },
      ),
    );
  }
}
