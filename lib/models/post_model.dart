// ignore_for_file: prefer_collection_literals

class TaskModel {
  String? sId;
  String? title;
  String? body;

  TaskModel({this.sId, this.title, this.body});

  TaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  static void add(TaskModel TaskModel) {}
}
