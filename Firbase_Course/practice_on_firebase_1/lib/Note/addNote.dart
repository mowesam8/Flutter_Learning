import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/Note/viewNote.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key, required this.docId});
  final String docId;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController note = TextEditingController();

  bool isLoading = false;

  addNote() async {
    CollectionReference collectionNote = FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.docId)
        .collection("note");

    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});

        DocumentReference response = await collectionNote.add({
          "note": note.text,
        });

        Navigator.of(context).push(
          MaterialPageRoute(builder: (c) => ViewNote(categoryId: widget.docId)),
        );
      } catch (e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: "Error $e",
        ).show();
      } finally {
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Form(
        key: formState,

        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.secondaryColor,
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    child: CustomTextfield(
                      labelText: "Name",
                      hintText: "Enter Your Note",
                      controller: note,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return "This field can`t be Empty";
                        }

                        return null;
                      },
                    ),
                  ),

                  CustomButton(
                    onPressed: () {
                      addNote();
                    },

                    title: "Add",
                  ),
                ],
              ),
      ),
    );
  }
}
