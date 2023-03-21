import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fpractice_rest_api/models/users_models.dart';
import 'package:fpractice_rest_api/presentation/screens/second_screen.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<PostModel> listOfPostModels = [];

  @override
  void initState() {
    getList();
    log("message1");
    super.initState();
  }

  Future<void> getList() async {
    log("message2");
    listOfPostModels = await getExample();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: listOfPostModels.length,
          itemBuilder: ((context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                SecondScreen(id: listOfPostModels[index].id))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(listOfPostModels[index].name),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

Future<List<PostModel>> getExample() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/users');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(response.body);
  List<PostModel> listOfPostModels = [];
  
  (data as List).forEach((element) {
    listOfPostModels.add(PostModel.fromJson(element));
  });
  log(response.body);
  return listOfPostModels;
}
