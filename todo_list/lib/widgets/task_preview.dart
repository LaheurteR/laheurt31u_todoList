import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';

import '../screens/task_form.dart';

class TaskPreview extends StatefulWidget {
  final Task task;

  const TaskPreview({super.key, required this.task});

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}



class _TaskPreviewState extends State<TaskPreview> {
  late bool _isChecked;

  Color changeColor() {
    if (widget.task.completed == true) {
      return Colors.green.shade400;
    } else {
      return Colors.white38;
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
              builder: (context) => TaskForm(type: Type.edit,
                  t: widget.task)),
        );
      },
    );
  }
}
