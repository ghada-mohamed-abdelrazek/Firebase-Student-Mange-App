import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_flutter_firebase/home/controller/home_cubit.dart';
import 'package:login_signup_flutter_firebase/home/view/student_add_screen.dart';
import 'package:lottie/lottie.dart';

class GetStudent extends StatelessWidget {
  const GetStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit()..getStudentFromServer(),
  child: Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add,color: Colors.blue.shade900,),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudentAddScreen())
              );
            },
        ),
        appBar: AppBar(
        backgroundColor: Colors.transparent,
    elevation: 0,
    leading: SizedBox.shrink(),
          centerTitle: true,
          title: Text("Students Data ",
              style:  TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black ,
              ),
          ),
        ),
        body: BlocBuilder<HomeCubit,HomeState>(
            builder: (context, state){
              print("===============This $state===============");
              if(state is HomeLoading){
                return Center(child: Lottie.asset("assets/json/loading.json"));
              }
              if (state is StudentsgetSuccess){
                if(state.Student.isEmpty){
                  return Center(child: Text("No Student Exist Yet"),);
                }
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade700,
                        Colors.blue.shade50,
                        ],
                      ),
                  ),
                  child: Padding(padding:EdgeInsets.all(12),
                    child: ListView.builder(
                        itemCount: state.Student.length,
                        itemBuilder:(context, index) {
                          final student = state.Student[index];
                          return Container(
                            margin: EdgeInsets.all(12),
                            width: 400,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,


                              borderRadius: BorderRadius.circular(12),
                              border:Border.all(color: Colors.blueGrey.shade600),
                            ),
                            child: ListTile(
                              title: Text('Student Name is ${student['name']}', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),
                              ),
                              subtitle: Text('Grade is ${student['grade']}', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                              ),

                              trailing:Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue.shade200
                                ),
                                child: Center(
                                  child: Text(' ${student['age'] } Years',style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                                              ),),
                                ), ),
                            ),
                          );
                        }
                    ),
                  ),
                );
              }
              return Text('no state');
            }
        ),
      ),
);
  }
}
