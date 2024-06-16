import 'package:flutter/material.dart';
import 'package:todo_list/screens/task_details.dart';
import 'package:todo_list/task.dart';

class TaskPreview extends StatefulWidget {
  final Task task;

  const TaskPreview({super.key, required this.task});

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}



class _TaskPreviewState extends State<TaskPreview> {
  late bool _isChecked;

  ColorSwatch<int> changeColor() {
    if (widget.task.completed == true) {
      return Colors.green;
    } else {
      return Colors.redAccent;
    }
  }

  void onUpdateTask(Task t)
  {
    widget.task.content = t.content;
    widget.task.completed = t.completed;
    widget.task.titre = t.titre;
    _isChecked = t.completed;
    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    _isChecked = widget.task.completed;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.titre),
      tileColor: changeColor(),
      trailing: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
            widget.task.completed = value;
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TaskDetails(
                  task: widget.task, onUpdateTask: onUpdateTask)),
        );
      },
    );
  }
}
