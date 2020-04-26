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
      body: Padding(
          padding: EdgeInsets.only(top: 35.0, left: 15.0, right: 15.0),
          child: ListView(
            children: <Widget> [
              Column(
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
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: descController,
                      style: textStyle,
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
                      value: _priority,
                      onChanged: (String value) => value
                    )
                  )
                ]
              )
            ]
          )
      )
    );
  }

}