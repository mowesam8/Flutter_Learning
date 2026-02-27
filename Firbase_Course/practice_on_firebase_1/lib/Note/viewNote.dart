import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Note/addNote.dart';
import 'package:practice_on_firebase_1/Note/editNote.dart';
import 'package:practice_on_firebase_1/auth/login.dart';
import 'package:practice_on_firebase_1/pages/home.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  List<QueryDocumentSnapshot> data = [];

  bool isLoading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.categoryId)
        .collection("note")
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
        title: Text("Note"),

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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (c) => AddNote(docId: widget.categoryId),
            ),
          );
        },
        shape: CircleBorder(),

        backgroundColor: AppColor.primaryColor,

        child: Icon(Icons.add, color: Colors.white),
      ),

      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (c) => Home()),
            (route) => false,
          );
        },
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.secondaryColor,
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => EditNote(
                              noteDocId: data[index].id,
                              cateogryDocId: widget.categoryId,
                              oldValue: data[index]["note"],
                            ),
                          ),
                        );
                      },

                      onLongPress: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: "Delete This Note",
                          desc: "Are you sure you want to delete this note permanently",

                          showCloseIcon: true,
                          headerAnimationLoop: false,

                          btnCancelOnPress: () async {
                            
                          },

                          btnOkOnPress: () async {
                            await FirebaseFirestore.instance
                                .collection("categories")
                                .doc(widget.categoryId).collection("note").doc(data[index].id)
                                .delete();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (c) => ViewNote(categoryId: widget.categoryId)),
                            );
                          },
                        ).show();
                      },

                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                data[index]["note"],

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
      ),
    );
  }
}
