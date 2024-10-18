// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:crud_crud_api/models/post_model.dart';
import 'package:crud_crud_api/service/api_service.dart';
import 'package:flutter/material.dart';

class Crud_CrudApi extends StatefulWidget {
  const Crud_CrudApi({super.key});

  @override
  State<Crud_CrudApi> createState() => _Crud_CrudApiState();
}

class _Crud_CrudApiState extends State<Crud_CrudApi> {
  List<TaskModel> PostData = [];

  bool isApploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  isApploading
          //     ? Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          FutureBuilder(
        future: getTaskApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    // title: Text(
                    //     snapshot.data?[index].sId.toString() ?? 'No Title'),
                    subtitle: Text(
                        snapshot.data?[index].title.toString() ?? 'No Title'),
                    trailing: Text(
                        snapshot.data?[index].body.toString() ?? 'Not Data'),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isApploading = true;
          setState(() {});

          await Future.delayed(Duration(seconds: 2));
          isApploading = false;
          setState(() {});
        },
        child: isApploading
            ? CircularProgressIndicator()
            : Icon(Icons.add, color: Colors.green),
      ),
    );
  }
}
