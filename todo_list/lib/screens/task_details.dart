import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';

class TaskDetails extends StatefulWidget {
  final Task task;
  final Function(Task) onUpdateTask;

  const TaskDetails({required this.task, required this.onUpdateTask, super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late TextEditingController _titreController;
  late TextEditingController _contentController;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _titreController = TextEditingController(text: widget.task.titre);
    _contentController = TextEditingController(text: widget.task.content);
    _isChecked = widget.task.completed;
  }

  String donnerEtat() {
    if (widget.task.completed) {
      return 'Oui';
    } else {
      return "Non";
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerte'),
          content: const Text('Les champs ne peuvent pas être vides'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void _saveTask() {
    if (_titreController.text.isEmpty || _contentController.text.isEmpty)
      {
        _showAlertDialog(context);
      }
    else
      {
        widget.task.titre = _titreController.text;
        widget.task.content = _contentController.text;
        widget.onUpdateTask(widget.task);
        _showSnackBar(context, 'La tâche a été modifiée');
        // Save updated task details

        // Navigate back or perform any other action
        Navigator.pop(context);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail des tâches'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Titre de la tâche :',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _titreController,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contenu de la tâche :',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _contentController,
                style: const TextStyle(fontSize: 18),
                maxLines: null, // Allow multiple lines
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Tâche complétée ? : ${donnerEtat()}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                        widget.task.completed = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTask,
                child: const Text('Enregistrer'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
