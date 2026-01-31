import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/auth/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 70),
            color: AppColor.primaryColor,
            child: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c) => Login()), (route) => false,);
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
