import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_flutter_firebase/auth/view/login.dart';
import 'package:login_signup_flutter_firebase/core/resourses/app_field.dart';
import 'package:login_signup_flutter_firebase/home/view/get_student.dart';
import 'package:lottie/lottie.dart';

import '../../widgest/custom_password_field.dart';
import '../auth_cubit.dart';

class SigupPage extends StatelessWidget {
  const SigupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (contxet, state){
          print("This is $state=========================");

          if(state is RegisterSuccess){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (contxet)=>GetStudent()),
            );
          }

        },
          builder: (context, state){
            print("This is $state=========================");

            if(state is RegisterLoading){
              return Center(child: Lottie.asset("assets/json/loading.json"));
            }
            final cubit= context.read<AuthCubit>();
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create your Account",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Let’s create your account.",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff808080)
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Email",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A)),
                      ),
                      SizedBox(height: 4),

                      AppField(hintText: "Enter Your Email", endIcon: SizedBox(),controller: cubit.emailControl,),
                      SizedBox(height: 30),
                      Text("Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A)),
                      ),
                      SizedBox(height: 4),
                      CustomPasswordField(
                        hint:"************",

                        controller: cubit.passwordControl,
                      ),
                      SizedBox(height: 100),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: ()=>cubit.signUp(),
                              style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(350, 50),
                              ),
                              child: Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),)
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff808080)
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return LoginPage();
                                      }));
                            },
                            child: Text("Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1A1A1A),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );

          },),
      ),
    );
  }
}