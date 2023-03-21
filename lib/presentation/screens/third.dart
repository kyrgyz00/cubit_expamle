import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpractice_rest_api/cubit/users_cubit.dart';
import 'package:fpractice_rest_api/models/users_models.dart';
import 'package:fpractice_rest_api/presentation/screens/error_page.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel> listOfPostModels = [];

  UsersCubit _cubit = UsersCubit();
  @override
  void initState() {
    _cubit.getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        bloc: _cubit,
        builder: (context, state) {
          if(state is UnCorrectUrlState){
            return ErrorPage(erorText: state.unCorrectUrl);
          }
          if (state is LoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 6,
            ));
          }
          if (state is UsersFetchedState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: 400,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text("name: ${state.postModel[index].name}"),
                              Text(
                                  "username: ${state.postModel[index]..username}"),
                              Text(
                                  "city : ${state.postModel[index].address.city}"),
                              Text(
                                  "street: ${state.postModel[index].address.street}"),
                              Text(
                                  "suite: ${state.postModel[index].address.suite}"),
                              Text(
                                  "zipcode: ${state.postModel[index].address.zipcode}"),
                              Text(
                                  "geo lat: ${state.postModel[index].address.geo.lat}"),
                              Text(
                                  "geo lng: ${state.postModel[index].address.geo.lng}"),
                              Text(
                                  "company name: ${state.postModel[index].company.name}"),
                              Text(
                                  "company catchPhrase: ${state.postModel[index].company.catchPhrase}"),
                              Text("email: ${state.postModel[index].email}"),
                              Text(
                                  "website: ${state.postModel[index].website}"),
                              Text("phone: ${state.postModel[index].phone}"),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: ((context, index) {
                        return const Divider();
                      }),
                      itemCount: state.postModel.length),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
