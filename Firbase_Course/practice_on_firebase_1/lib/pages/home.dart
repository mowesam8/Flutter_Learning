import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Categories/addCategory.dart';
import 'package:practice_on_firebase_1/Categories/editCategory.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Note/viewNote.dart';
import 'package:practice_on_firebase_1/auth/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);

    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
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

      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColor.secondaryColor),
            )
          : Padding(
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => ViewNote(categoryId: data[index].id),
                        ),
                      );
                    },

                    onLongPress: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.infoReverse,
                        animType: AnimType.rightSlide,
                        title: "Manage This Note",
                        desc: "You can edit or permanently delete this note",

                        showCloseIcon: true,
                        headerAnimationLoop: false,

                        btnCancelText: "Delete",
                        btnCancelOnPress: () async {
                          await FirebaseFirestore.instance
                              .collection("categories")
                              .doc(data[index].id)
                              .delete();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (c) => Home()),
                          );
                        },

                        btnOkText: "Edit",
                        btnOkOnPress: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => Editcategory(
                                docId: data[index].id,
                                oldName: data[index]["name"],
                              ),
                            ),
                          );
                        },
                        btnOkColor: Colors.orange,
                      ).show();
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Icon(
                              Icons.note_alt_outlined,
                              size: 100,
                              color: AppColor.secondaryColor,
                            ),

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
                    ),
                  );
                },
              ),
            ),
    );
  }
}
