import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpractice_rest_api/helpers/api_requster.dart';
import 'package:fpractice_rest_api/helpers/error_helper.dart';
import 'package:fpractice_rest_api/models/users_models.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  Future<void> getUsers() async {
    List<PostModel> userModelList = [];
    APIRequester apiRequester = APIRequester();

    emit(LoadingState(loading: true));
    try {
      var response = await apiRequester.toGet("/users");
      response.data;
      // log("${response.data}");

      userModelList =
          (response.data as List).map((e) => PostModel.fromJson(e)).toList();

      emit(UsersFetchedState(userModelList));
    } catch (error) {
      print(error);
      if (error == ErrorsEnum.invalidError) {
        emit(UnCorrectUrlState("Uncorrect Url"));
      } else if (error == ErrorsEnum.noInternetConnectionError) {
        emit(NoInternetConnectionState(
            ErrorsEnum.noInternetConnectionError.toString()));
      }
      print(e.toString());
    }
  }
}
