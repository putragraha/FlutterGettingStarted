class Todo {

  int _id; 

  String _title;

  String _desc;

  String _date;

  int _priority;

  Todo(this._title, this._priority, this._date, [this._desc]);

  Todo.withId(this._id, this._title, this._priority, this._date, [this._desc]);

  int get id => this._id;

  String get title => this._title;

  String get desc => this._desc;

  String get date => this._date;

  int get priority => this._priority;

  set title(String title) {
    if (title.length <= 255) {
      this._title = title;
    }
  }

  set desc(String desc) {
    if (desc.length <= 255) {
      this._desc = desc;
    }
  }

  set priority(int priority) {
    if (priority > 0 && priority <= 3) {
      this._priority = priority;
    }
  }

  set date(String date) {
    this._date = date;
  }

  Map<String, dynamic> toMap() {
    var todoMap = Map<String, dynamic>();
    todoMap["title"] = this._title;
    todoMap["desc"] = this._desc;
    todoMap["date"] = this._date;
    todoMap["priority"] = this._priority;

    if (this._id != null) {
      todoMap["id"] = this._id;
    }

    return todoMap;
  }

  Todo.fromObject(dynamic object) {
    this._id = object["id"];
    this._title = object["title"];
    this._desc = object["desc"];
    this._date = object["date"];
    this._priority = object["priority"];
  }
}