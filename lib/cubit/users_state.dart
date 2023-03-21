part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersFetchedState extends UsersState {
  final List<PostModel> postModel;

  UsersFetchedState(this.postModel);
}

class LoadingState extends UsersState {
  final bool loading;

  LoadingState({required this.loading});
}

class LoadingErrorState extends UsersState {
  final String loadingError;

  LoadingErrorState(this.loadingError);
}

class NoInternetConnectionState extends UsersState {
  final String invalidError;

  NoInternetConnectionState(this.invalidError);


}

class UnCorrectUrlState extends UsersState {
  final String unCorrectUrl;

  UnCorrectUrlState(this.unCorrectUrl);
}
