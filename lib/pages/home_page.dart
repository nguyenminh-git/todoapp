import 'package:flutter/material.dart';
import 'package:todolist/util/dialog_box.dart';
import '../util/todo_title.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Make Tutorial', true],
    ['Code App', false],
  ];
  // check box task
  void checkboxchanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      //add new task to list
      todoList.add([_controller.text,false]);
      // clear textfiled
      _controller.clear();
    });
    Navigator.of(context).pop();
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
  }
  // delect task
  void delectTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
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
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            delectFunction: (context)=> delectTask(index),
          );
        },
      ),
    );
  }
}
