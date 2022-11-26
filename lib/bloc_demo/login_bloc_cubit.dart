import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginBlocInitial());

  void validate(String email, String pwd) async {
    emit(LoadingState());

    print("--print ------ ${email} ");
    print("--print ------ ${pwd} ");
    if (email.isEmpty) {
      emit(ErrorState("please enter email"));
      emit(LoginBlocInitial());
    } else if (pwd.isEmpty) {
      emit(ErrorState("please enter password"));
      emit(LoginBlocInitial());
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(RoutScreen());
    }
  }
}
