import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/tasks_provider.dart';
import 'package:todo_list/task.dart';

enum Type { edit, add }

class TaskForm extends StatefulWidget {
  final Type type;
  final Task? t;

  const TaskForm({required this.type, this.t, super.key});

  Text initText() {
    if (type == Type.edit) {
      return const Text('Modification de la tâche');
    } else {
      return const Text('Ajout d\'une tâche');
    }
  }

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titreController;
  late TextEditingController _contentController;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _titreController = TextEditingController(text: '');
    _contentController = TextEditingController(text: '');
    _isChecked = false;
    if (widget.type == Type.edit) {
      _titreController.text = widget.t!.titre;
      _contentController.text = widget.t!.content;
      _isChecked = widget.t!.completed;
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
    if (_titreController.text.isEmpty || _contentController.text.isEmpty) {
      _showAlertDialog(context);
    } else {
      if (widget.type == Type.add) {
        Task t = Task(
            t: _titreController.text,
            c: _contentController.text,
            completed: false);
        Provider.of<TasksProvider>(context, listen: false).addTask(t);
      } else {
        widget.t!.titre = _titreController.text;
        widget.t!.content = _contentController.text;
        Provider.of<TasksProvider>(context, listen: false)
            .updateTask(widget.t!);
      }
      Navigator.pop(context);
      _showSnackBar(context, 'La tâche a bien été enregistrée');
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
        title: widget.initText(),
      ),
      body: SafeArea(
        child: Center(
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
            Visibility(
              visible: widget.type == Type.edit,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Complétée ? '),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value ?? false;
                          widget.t?.completed = value ?? false;
                        });
                      },
                    ),
                  ]
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
      ),
    );
  }
}
