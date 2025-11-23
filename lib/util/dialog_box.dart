import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: Container(
        height: 140,
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              // gắn controller vào textfield
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onSave, 
                  child: Text('Save')
                ),
                ElevatedButton(
                  onPressed: onCancel, 
                  child: Text('Cancel')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
