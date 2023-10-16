import 'package:flutter/material.dart';
import './pages/dtabase_tasks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(),
    );
  }
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
// Lista de tareas de ejemplo
  List<Task> tasks = [
    Task(
        title: 'Hacer las tareas',
        done: true,
        description: 'Terminar la tareas de las clases que tengo.'),
    Task(
        title: 'Lavar los platos',
        done: false,
        description: 'Lavar los platos de ayer.'),
    Task(
        title: 'Hacer comida',
        done: false,
        description: 'Hacer comida para la familia por la tarde.'),
    Task(
        title: 'Organizar cita con pediatra',
        done: false,
        description:
            'Llamar a la oficina del pediatra para organizar una cita.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: task.done
                ? Icon(Icons.check_box, color: Colors.green)
                : Icon(Icons.check_box_outline_blank, color: Colors.red),
            onTap: () {
              setState(() {
                task.done = !task.done;
              });
            },
          );
        },
      ),
    );
  }
}
