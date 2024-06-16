import 'package:flutter/material.dart';
import 'package:todo_list/services/task_service.dart';
import 'package:todo_list/task.dart';

class TaskForm extends StatefulWidget {
  final Function() updateTasks;

  const TaskForm({required this.updateTasks, super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titreController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titreController = TextEditingController(text: '');
    _contentController = TextEditingController(text: '');
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
    if (_titreController.text.isEmpty || _contentController.text.isEmpty) {
      _showAlertDialog(context);
    } else {
      Task t = Task(t: _titreController.text, c: _contentController.text);
      TaskService.createTask(t);
      widget.updateTasks();
      _showSnackBar(context, 'La tâche a bien été enregistrée');
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titreController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Tâche'),
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
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTask,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
