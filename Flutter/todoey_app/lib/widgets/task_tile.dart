import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxCallback (bool? checkboxstate)
  {
    setState(() {
      isChecked = checkboxstate!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is a task", style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null)),
      trailing: CheckBox(checkboxstate: isChecked, toggle: checkboxCallback,),
    );
  }
}

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key, required this.checkboxstate, required this.toggle
  });
  final bool checkboxstate;
  final Function(bool?) toggle;

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxstate,
     onChanged: toggle,
    activeColor: Colors.lightBlueAccent,
    );
  }
}