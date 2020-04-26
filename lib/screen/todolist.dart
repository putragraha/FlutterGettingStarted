import 'package:flutter/material.dart';
import 'package:getting_started/model/todo.dart';
import 'package:getting_started/screen/tododetail.dart';
import 'package:getting_started/util/dbhelper.dart';

class TodoList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {

  DbHelper _dbHelper = DbHelper();

  List<Todo> todos;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }

    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToDetail(Todo('', 3, '')),
        tooltip: "Add New Todo",
        child: Icon(Icons.add)
      )
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getColors(this.todos[position].priority),
              child: Text(this.todos[position].priority.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].date),
            onTap: () => navigateToDetail(this.todos[position])
          ),
        );
      });
  }

  Color _getColors(int priority) {
    switch(priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  void getData() {
    final dbFuture = _dbHelper.initializeDb();

    dbFuture.then((database) {
      final todosFuture = _dbHelper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;

        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }

        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => TodoDetail(todo))
    );
  }
}