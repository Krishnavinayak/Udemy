
import 'package:flutter/material.dart';
import 'package:todoey_app/screens/add_task.dart';
import 'package:todoey_app/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) => AddTask());
      },
      backgroundColor: Colors.lightBlueAccent,
      child: Icon(Icons.add, color: Colors.white,),),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list, size: 30, color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 10,),
                Text("Todoey",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
                ),
                Text("12 Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
                
              ],
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white
            ),
            child: TaskList(),
          ))
        ],
      ),
    );
  }
}
