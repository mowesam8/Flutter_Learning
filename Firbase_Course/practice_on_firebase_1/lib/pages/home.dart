import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

    data = querySnapshot.docs;

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
        title: Text("My Notes"),

        actions: [
          IconButton(
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (c) => Login()),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
            tooltip: "Logout",
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
          : data.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_add_outlined,
                    size: 80,
                    color: AppColor.secondaryColor,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No categories yet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tap + to create your first category",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
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
                  return InkWell(
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
                        title: "Manage This Category",
                        desc: "You can edit or permanently delete this category",

                        showCloseIcon: true,
                        headerAnimationLoop: false,

                        btnCancelText: "Delete",
                        btnOkText: "Edit",
                        btnOkColor: Colors.orange,

                        btnCancelOnPress: () async {
                          await FirebaseFirestore.instance
                              .collection("categories")
                              .doc(data[index].id)
                              .delete();

                          if (!mounted) return;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (c) => Home()),
                          );
                        },

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
                      ).show();
                    },
                    child: Card(
                      elevation: 2,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note_alt_outlined,
                            size: 70,
                            color: AppColor.secondaryColor,
                          ),

                          SizedBox(height: 12),

                          Text(
                            data[index]["name"],
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
