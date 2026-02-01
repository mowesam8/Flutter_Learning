import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/Custom/Custom_logo.dart';
import 'package:practice_on_firebase_1/auth/signup.dart';
import 'package:practice_on_firebase_1/pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isLoading = false;

  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     setState(() => isLoading = true);

  //     final authEventFuture = GoogleSignIn.instance.authenticationEvents
  //         .firstWhere(
  //           (event) => event is GoogleSignInAuthenticationEventSignIn,
  //         );

  //     await GoogleSignIn.instance.authenticate();

  //     final event =
  //         await authEventFuture as GoogleSignInAuthenticationEventSignIn;

  //     final GoogleSignInAccount user = event.user;

  //     final googleAuth = await user.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on GoogleSignInException catch (e) {
  //     debugPrint('Google Sign-In error: ${e.code}');
  //     return null;
  //   } catch (e) {
  //     debugPrint('Unknown error: $e');
  //     return null;
  //   } finally {
  //     if (mounted) setState(() => isLoading = false);
  //   }
  // }

  Future<void> signInWithGoogle() async {
    try {
      setState(() => isLoading = true);

      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      if (googleUser == null) {
        debugPrint("Google Sign-In cancelled by user");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (!mounted) return;

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (c) => Home()));
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: "Firebase Error",
        desc: e.message ?? "Something went wrong",
      ).show();
    } on GoogleSignInException catch (e) {
      debugPrint("Google Sign-In error: ${e.code}");
    } catch (e) {
      debugPrint("Unknown error: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();

    GoogleSignIn.instance.initialize();
  }

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
                    "Login",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Login To Continue Using The App",
                    style: TextStyle(color: Colors.grey),
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

                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    alignment: Alignment.topRight,

                    child: Text("Forget Password ?"),
                  ),
                ],
              ),
            ),

            CustomButton(
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text,
                        );

                    if (!mounted) return;

                    if (credential.user!.emailVerified) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (c) => Home()),
                      );
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc:
                            "Please check your email and click the link to activate your account.",
                      ).show();
                    }
                  } on FirebaseAuthException catch (e) {
                    if (!mounted) return;

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: "Invalid email or password",
                    ).show();
                  } finally {
                    if (mounted) setState(() => isLoading = false);
                  }
                }
              },
              title: isLoading ? "Loading..." : "Login",
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: Divider()),

                Text(
                  "  Or Login With Google  ",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),

                Expanded(child: Divider()),
              ],
            ),

            SizedBox(height: 20),

            MaterialButton(
              color: AppColor.secondaryColor,

              height: 48,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              onPressed: () {
                signInWithGoogle();
              },

              child: Image.asset("assets/images/google.png", width: 30),
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Don`t Have An Account? ", style: TextStyle(fontSize: 14)),

                MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 0,

                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (c) => Signup()),
                    );
                  },

                  child: Text(
                    "Register",

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
