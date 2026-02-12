import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/Custom/Custom_logo.dart';
import 'package:practice_on_firebase_1/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  CustomLogo(),

                  SizedBox(height: 30),

                  Text(
                    "Signup",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "ُEnter Your Personal Information",
                    style: TextStyle(color: Colors.grey),
                  ),

                  CustomTextfield(
                    labelText: "Username",
                    hintText: "Enter your name",
                    controller: username,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "This field can`t be Empty";
                      }

                      return null;
                    },
                  ),

                  CustomTextfield(
                    labelText: "Email",
                    hintText: "Enter your email",
                    controller: email,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "This field can`t be Empty";
                      }

                      return null;
                    },
                  ),

                  CustomTextfield(
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: password,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "This field can`t be Empty";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            CustomButton(
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );

                    FirebaseAuth.instance.currentUser!.sendEmailVerification();

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (c) => Login()),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The password provided is too weak.',
                      ).show();
                    } else if (e.code == 'email-already-in-use') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The account already exists for that email.',
                      ).show();
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
              title: "Signup",
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Already Have An Account? ",
                  style: TextStyle(fontSize: 14),
                ),

                MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 0,

                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (c) => Login()),
                    );
                  },

                  child: Text(
                    "Login",

                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
