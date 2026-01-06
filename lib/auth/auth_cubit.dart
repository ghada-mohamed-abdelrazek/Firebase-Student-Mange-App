import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final fireAuth  =FirebaseAuth.instance;
  TextEditingController emailControl =TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  Future<void> signUp() async {
    emit(RegisterLoading());
    try {
      await fireAuth.createUserWithEmailAndPassword(
          email: emailControl.text,
          password: passwordControl.text
      );
      emit(RegisterSuccess());

    }on FirebaseAuthException catch (e) {
      emit(RegisterFailure());
    }catch (e) {
      emit(RegisterFailure());
    }

  }
  Future<void> login() async {
    emit(LoginLoading());
    try {
      await fireAuth.signInWithEmailAndPassword(email: emailControl.text, password: passwordControl.text);
      emit(LoginSuccess());

    }on FirebaseAuthException catch (e) {
      emit(LoginFailure());
    }catch (e) {
      emit(LoginFailure());
    }

  }

}
