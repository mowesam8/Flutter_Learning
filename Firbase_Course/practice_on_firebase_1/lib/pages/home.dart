import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Categories/addCategory.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/auth/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .get();

    data.addAll(querySnapshot.docs);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Home Page"),

        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (c) => Login()),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (c) => Addcategory()));
        },
        shape: CircleBorder(),

        backgroundColor: AppColor.primaryColor,

        child: Icon(Icons.add, color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 180,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),

          itemCount: data.length,

          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.note_alt_outlined, size: 100, color: AppColor.secondaryColor,),

                    Text(
                      data[index]["name"],

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
