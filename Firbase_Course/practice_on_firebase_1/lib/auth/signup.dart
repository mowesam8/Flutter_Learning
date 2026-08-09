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

  bool isLoading = false;

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColor.secondaryColor),
            )
          : Container(
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
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
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

                            if (val.trim().length < 3) {
                              return "Username must be at least 3 characters";
                            }

                            return null;
                          },
                        ),

                        CustomTextfield(
                          labelText: "Email",
                          hintText: "Enter your email",
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "This field can`t be Empty";
                            }

                            if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(val.trim())) {
                              return "Enter a valid email address";
                            }

                            return null;
                          },
                        ),

                        CustomTextfield(
                          labelText: "Password",
                          hintText: "Enter your password",
                          controller: password,
                          obscureText: true,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "This field can`t be Empty";
                            }

                            if (val.length < 8) {
                              return "Password must be at least 8 characters";
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
                          isLoading = true;
                          setState(() {});

                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: email.text.trim(),
                                password: password.text,
                              );

                          await credential.user!.sendEmailVerification();

                          if (!mounted) return;

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) => Login()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (!mounted) return;

                          String message;

                          switch (e.code) {
                            case 'weak-password':
                              message =
                                  'The password provided is too weak. It must be at least 6 characters.';
                              break;
                            case 'email-already-in-use':
                              message =
                                  'The account already exists for that email.';
                              break;
                            case 'invalid-email':
                              message =
                                  'The email address is badly formatted.';
                              break;
                            case 'network-request-failed':
                              message =
                                  'Check your internet connection and try again.';
                              break;
                            case 'operation-not-allowed':
                              message =
                                  'Email/password accounts are not enabled.';
                              break;
                            default:
                              message =
                                  'Something went wrong. Please try again.';
                          }

                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: message,
                          ).show();
                        } catch (e) {
                          if (!mounted) return;
                          print(e);
                        } finally {
                          if (mounted) setState(() => isLoading = false);
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
