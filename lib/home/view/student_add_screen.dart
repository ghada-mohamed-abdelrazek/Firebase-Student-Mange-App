import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_flutter_firebase/home/controller/home_cubit.dart';
import 'package:login_signup_flutter_firebase/home/view/get_student.dart';
import 'package:lottie/lottie.dart';


class StudentAddScreen extends StatelessWidget {
  const StudentAddScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Add Student',
              style:  TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black ,
              )),
          centerTitle: true,
        ),

        body: BlocConsumer<HomeCubit, HomeState>(listener: (contxet, state){
          print("This is $state=========================");

          if(state is StudentsAddSuccess){
            Navigator.of(context).push(MaterialPageRoute(builder: (contxet)=>GetStudent()));
          }

        },
          builder: (context, state){
            print("This is $state=========================");

            if(state is HomeLoading){
              return Center(child: Lottie.asset("assets/json/loading.json"));
            }
            final cubit= context.read<HomeCubit>();
            return Padding(padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text('Student Name:',
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black ,
                    )
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue)
                      ),
                    ),
                    controller: cubit.nameControl,
                  ),
                  Text('Student Age:',
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black ,
                      )
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue)
                      ),
                    ),
                    controller: cubit.ageControl,

                  ),
                  Text('Student Grade:',
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black ,
                      )
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue)
                      ),
                    ),
                    controller: cubit.gradeControl,

                  ),
                  SizedBox(height: 60,),
                  ElevatedButton(
                      onPressed: ()=>cubit.addStudentToServer(),
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        fixedSize: Size(350, 50),
                      ),
                      child: Text('Add your Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                      ))
                ],
              ),
            );

          },),
      ),
    );
  }
}