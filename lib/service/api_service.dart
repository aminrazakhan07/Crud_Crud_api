import 'dart:convert';

import 'package:crud_crud_api/models/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<TaskModel>> getTaskApi() async {
  List<TaskModel> taskData = [];
  var url = Uri.parse(
      'https://crudcrud.com/api/410114c3453c4451bf9b832337c1cc51/tasks');
  var response = await http.get(url);
  var responseBody = jsonDecode(response.body);

  for (var eachMpag in responseBody) {
    taskData.add(TaskModel.fromJson(eachMpag));
  }
  return taskData;
}

postTaskApi() async {
  var url = Uri.parse(
      'https://crudcrud.com/api/410114c3453c4451bf9b832337c1cc51/tasks');
  var response = await http.post(
    url,
    headers: {"Content-type": "Application/json"},
    body: {
      "title": "Second Project",
      "body": "2nd Flutter Project",
    },
  );
  print(response);
}
