import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add Task",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 30,
          ),),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: (){

          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.lightBlueAccent
          ),
           child: Text("Add",
           style: TextStyle(
            color: Colors.white
           ),
           )
           )
        ],
      ),
    );
  }
}