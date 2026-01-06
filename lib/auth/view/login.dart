import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_flutter_firebase/auth/view/sigup.dart';
import 'package:login_signup_flutter_firebase/core/resourses/app_field.dart';
import 'package:login_signup_flutter_firebase/home/view/get_student.dart';
import 'package:login_signup_flutter_firebase/widgest/custom_password_field.dart';
import 'package:lottie/lottie.dart';

import '../auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocConsumer<AuthCubit, AuthState>(listener: (contxet, state){
          print("This is $state=========================");

          if(state is LoginSuccess){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (contxet)=>GetStudent()));
          }

        },
          builder: (context, state){
            print("This is $state=========================");

            if(state is LoginLoading){
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
                          Text("Login to your account",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1A1A1A)
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("It’s great to see you again.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff808080)
                            ),
                          ),
                          SizedBox(height: 30),
                          Text("User Name",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1A1A1A)),
                          ),
                        SizedBox(height: 4),
                        AppField(hintText:"Enter Your UserName",
                            endIcon: SizedBox(),
                            controller: cubit.emailControl,
                        ),
                        SizedBox(height: 30),
                        Text("Password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1A1A1A)),
                        ),
                          SizedBox(height: 4),
                          CustomPasswordField(
                            hint: "************",
                            controller: cubit.passwordControl,
                          ),
                          SizedBox(height: 100),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: ()=>cubit.login(),
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade400,
                                  fixedSize: Size(350, 50),
                                ),
                                child: Text('Log In'
                                  ,style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                                                      ),)),
                            ],
                          ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?  ",
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
                                          return SigupPage();
                                        }));
                              },
                              child: Text("Sign up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff1A1A1A),
                                  decoration: TextDecoration.underline,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                    )
                )
            );

          },),
      ),
    );
  }
}