import 'dart:html';

import 'package:flutter/material.dart';
import 'package:getting_started/model/todo.dart';
import 'package:getting_started/util/dbhelper.dart';
import 'package:intl/intl.dart';

DbHelper dbHelper = DbHelper();

const String mnuSave = "Save Todo and Back";

const String mnuDelete = "Delete Todo";

const String mnuBack = "Back to List";

final List<String> choices = const <String> [mnuSave, mnuDelete, mnuBack];

class TodoDetail extends StatefulWidget {

  final Todo todo;

  TodoDetail(this.todo);
  
  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State<TodoDetail> {

  Todo todo;

  TodoDetailState(this.todo);

  final _priorities = ["High", "Medium", "Low"];

  String _priority = "Low";

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descController.text = todo.desc;

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: _onPopupMenuButtonSelected,
                        itemBuilder: (BuildContext context) {
                          return choices.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: Text(choice)
                            );
                          }).toList();
                        },
                      )
                    ],
                  ),
                  body: Padding(
                      padding: EdgeInsets.only(top: 35.0, left: 15.0, right: 15.0),
                      child: ListView(
                        children: <Widget> [
                          Column(
                            children: <Widget>[
                              TextField(
                                controller: titleController,
                                style: textStyle,
                                onChanged: (value) => _updateTitle(),
                                decoration: InputDecoration(
                                  labelText: "Title",
                                  labelStyle: textStyle,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                  )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: TextField(
                                  controller: descController,
                                  style: textStyle,
                                  onChanged: (value) => _updateDesc(),
                                  decoration: InputDecoration(
                                    labelText: "Description",
                                    labelStyle: textStyle,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    )
                                  ),
                                )
                              ),
                              ListTile(
                                title: DropdownButton(
                                  items: _priorities.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value)
                                    );
                                  }).toList(), 
                                  style: textStyle,
                                  value: _retrievePriority(todo.priority),
                                  onChanged: (value) => _updatePriority(value)
                                )
                              )
                            ]
                          )
                        ]
                      )
                  )
                );
              }
            
  void _onPopupMenuButtonSelected(String value) {
    switch(value) {
      case mnuSave:
        _saveTodo();
        break;
      case mnuDelete:
        _deleteTodo();
        break;
      case mnuBack:
        _backToList();
        break;
      default:
        _backToList();
        break;
    }
  }

  void _saveTodo() {
    todo.date = DateFormat.yMd().format(DateTime.now());

    if (todo.id == null) {
      dbHelper.insertTodo(todo);
    } else {
      dbHelper.updateTodo(todo);
    }

    Navigator.pop(context, true);
  }
        
  void _deleteTodo() async {
    Navigator.pop(context, true);

    if (todo.id == null) {
      return;
    }

    int result = await dbHelper.deleteTodo(todo.id);

    if (result != 0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Delete Todo"),
        content: Text("Todo has been deleted")
      );

      showDialog(
        context: context,
        builder: (_) => alertDialog
      );
    }
  }

  void _backToList() {
    Navigator.pop(context, true);
  }

  void _updatePriority(String value) {
    switch (value) {
      case "High":
        todo.priority = 1;
        break;
      case "Medium":
        todo.priority = 2;
        break;
      case "Low":
        todo.priority = 3;
        break;
      default:
        todo.priority = 3;
        break;
    }

    setState(() {
      _priority = value;
    });
  }

  String _retrievePriority(int value) {
    return _priorities[value - 1];
  }

  void _updateTitle() {
    todo.title = titleController.text;
  }

  void _updateDesc() {
    todo.desc = descController.text;
  }
}