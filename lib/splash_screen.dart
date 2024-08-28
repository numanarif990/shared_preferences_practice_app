

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences_practicle_app/signup_screen.dart';
import 'package:shared_preferences_practicle_app/admin_screen.dart';
import 'package:shared_preferences_practicle_app/student_screen.dart';
import 'package:shared_preferences_practicle_app/teacher_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();islogin();
  }

  void islogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin")?? false;
    print(isLogin);
    String type = sp.getString("userType")?? '';
    print(type);
    if(isLogin){
      if(type == "Student"){
        Timer(const Duration(seconds: 3), (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentScreen()));
        });
      }else if(type == "Teacher"){
        Timer(const Duration(seconds: 3), (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TeacherScreen()));
        });
      }else if(type == "Admin"){
        Timer(const Duration(seconds: 3), (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminScreen()));
        });
      }
    }else{
      Timer(const Duration(seconds: 3), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: AssetImage("images/first.jpg"),),
    );
  }
}
