import 'package:flutter/material.dart';
import 'package:todolist/data/task_data.dart';
import 'widgets/tasklist.dart';
import 'package:provider/provider.dart';
import 'package:typed_data/typed_buffers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    color: Color(0xff757575),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Add Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            onChanged: (newText) {
                              newTaskTitle = newText;
                            },
                          ),
                          FlatButton(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              Provider.of<TaskData>(context)
                                  .addTask(newTaskTitle);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'TodoList',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
