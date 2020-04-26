import 'package:flutter/material.dart';
import 'package:getting_started/model/todo.dart';

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
        title: Text(todo.title)
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          TextField(
            controller: descController,
            style: textStyle,
            decoration: InputDecoration(
              labelText: "Description",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          DropdownButton(
            items: _priorities.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value)
              );
            }).toList(), 
            style: textStyle,
            value: "Low",
            onChanged: null
          )
        ]
      ),
    );
  }

}