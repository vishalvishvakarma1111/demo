part of 'login_bloc_cubit.dart';

@immutable
abstract class LoginBlocState {}

class LoginBlocInitial extends LoginBlocState {}

class LoadingState extends LoginBlocState {}

class ErrorState extends LoginBlocState {
  final String msg;

  ErrorState(this.msg);
}

class RoutScreen extends LoginBlocState {}
