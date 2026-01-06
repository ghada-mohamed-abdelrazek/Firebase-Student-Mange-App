import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_flutter_firebase/auth/view/login.dart';
import 'package:login_signup_flutter_firebase/home/controller/home_cubit.dart';
import 'package:login_signup_flutter_firebase/home/view/student_add_screen.dart';
import 'package:login_signup_flutter_firebase/splash.dart';
import 'firebase_options.dart';
import 'home/view/get_student.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        title: 'Flutter Demo',
        home: Splash(),

      ),
    );
  }
}

