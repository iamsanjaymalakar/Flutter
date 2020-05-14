import 'task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy eggs'),
    Task(title: 'Buy bread'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String title) {
    tasks.add(Task(title: title));
    notifyListeners();
  }

  void checkTask(Task task) {
    task.toggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
