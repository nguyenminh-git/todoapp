import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  final Function(BuildContext)? delectFunction;
  TodoTitle({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.delectFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delectFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //check box
            Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
            //task name
            Text(
              taskName,
              style: TextStyle(decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
