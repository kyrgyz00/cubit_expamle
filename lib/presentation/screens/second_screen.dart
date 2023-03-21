import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fpractice_rest_api/models/users_models.dart';

import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.id});
  final int id;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late PostModel model = PostModel(
    id: 0,
    name: "",
    username: "",
    email: "",
    address: Address(
      street: "",
      suite: "",
      city: "",
      zipcode: "",
      geo: Geo(
        lat: "",
        lng: "",
      ),
    ),
    phone: "",
    website: "",
    company: Company(
      name: "",
      catchPhrase: "",
      bs: "",
    ),
  );

  @override
  void initState() {
    getList();

    super.initState();
  }

  Future<void> getList() async {
    model = await getPost(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("Name:"),
                    const Text("User Name"),
                    const Text("email:"),
                    const Text("city"),
                    const Text("street"),
                    const Text("suite:"),
                    const Text("zipcode:"),
                    const Text("phone:"),
                    const Text("Geo lat:"),
                    const Text("Geo lng:"),
                    const Text("website:"),
                    const Text("id:"),
                    const Text("company name:"),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.name),
                      Text(model.username),
                      Text(model.email),
                      Text(model.address.city),
                      Text(model.address.street),
                      Text(model.address.suite),
                      Text(model.address.zipcode),
                      Text(model.phone),
                      Text(model.address.geo.lat),
                      Text(model.address.geo.lng),
                      Text(model.website),
                      Text(model.id.toString()),
                      Text(model.company.name),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text("company bs:"),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(model.company.bs),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("company bs:"),
                Expanded(
                  child: Text(model.company.catchPhrase),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<PostModel> getPost(int id) async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/users/$id');

  var response = await http.get(url);

  var data = jsonDecode(response.body);

  PostModel postModel = PostModel.fromJson(data);

  return postModel;
}
