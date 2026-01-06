import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final cloud = FirebaseFirestore.instance;
  TextEditingController nameControl =TextEditingController();
  TextEditingController ageControl = TextEditingController();
  TextEditingController gradeControl = TextEditingController();

  Future<void>addStudentToServer()async{
    emit(HomeLoading());
    try{
      await cloud.collection('students').add({
        'name':nameControl.text,
        'age':ageControl.text,
        'grade':gradeControl.text,
      });
      emit(StudentsAddSuccess());
    }catch(e) {
      emit(HomeFailure());
    }
  }
  Future<void>getStudentFromServer()async{
    emit(HomeLoading());
    try{
      final response = await cloud.collection('students').get();
      emit(StudentsgetSuccess(Student:response.docs));
    }catch(e) {
      emit(HomeFailure());
    }
  }

}
