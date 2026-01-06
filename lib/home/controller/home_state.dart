part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {}
final class StudentsAddSuccess extends HomeState {}
final class StudentsgetSuccess extends HomeState {
  List<QueryDocumentSnapshot>Student;
  StudentsgetSuccess({required this.Student});
}

final class HomeFailure extends HomeState {}
