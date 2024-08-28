import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_practicle_app/admin_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences_practicle_app/student_screen.dart';
import 'package:shared_preferences_practicle_app/teacher_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String userType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownSearch<String>(
             /* popupProps: const PopupProps.menu(
                showSelectedItems: true,
              ),*/
      /*  popupProps: PopupProps.bottomSheet(
            bottomSheetProps: BottomSheetProps(
                elevation: 2,
                backgroundColor: Colors.white,
            )),*/
              popupProps: const PopupProps.menu(
               fit: FlexFit.loose,
                showSelectedItems: true,
                menuProps: const MenuProps(
                  elevation: 10
                ),

        ),
              items: const ["Student", "Teacher", "Admin", ],
              validator: (String? item){
                if(item == null){
                  return 'required field';
                }else{
                  return null;
                }
              },

              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.3),
                  filled: true,

                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12, width: 2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
               /*   label:const Text("Select role"),
                  labelStyle: const TextStyle(
                    fontSize: 22
                  ),*/
                  hintText: 'Select role',
                  hintStyle: const TextStyle(
                    fontSize: 22
                  ),
                  label: const Icon(Icons.person_2_rounded,size: 35, color: Colors.grey,),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  labelStyle: const TextStyle(
                    fontSize: 22,

                  )
                ),
              ),
             onChanged: (String? newValue){
             setState(() {
               userType = newValue!;
               print(userType);
             });
            },

            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 22
              ),
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                fillColor: Colors.grey.withOpacity(.2),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12, width: 2)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(
                  fontSize: 22
              ),
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                fillColor: Colors.grey.withOpacity(.2),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12, width: 2)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(
                  fontSize: 22
              ),
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Age",
                fillColor: Colors.grey.withOpacity(.2),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12, width: 2)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("age", ageController.text.toString());
                sp.setBool("isLogin", true);
                sp.setString("userType", userType);
                  if(userType == "Student"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const StudentScreen()));
                  }else if(userType == "Teacher"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const TeacherScreen()));
                  }else if(userType == "Admin"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AdminScreen()));
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Signup",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
