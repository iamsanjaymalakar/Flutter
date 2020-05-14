import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/task_data.dart';
import 'tasktile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<TaskData>(context);
    return ListView.builder(
        itemCount: state.taskCount,
        itemBuilder: (context, i) {
          var task = state.tasks[i];
          return TaskTile(
            title: task.title,
            check: task.check,
            onChecked: (v) {
              state.checkTask(task);
            },
            onLongPressed: () {
              state.deleteTask(task);
            },
          );
        });
  }
}
