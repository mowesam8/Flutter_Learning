import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/Note/viewNote.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.noteDocId, required this.cateogryDocId, required this.oldValue});
  final String noteDocId;
  final String cateogryDocId;
  final String oldValue;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController note = TextEditingController();

  bool isLoading = false;

  editNote() async {
    CollectionReference collectionNote = FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.cateogryDocId)
        .collection("note");

    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});

        await collectionNote.doc(widget.noteDocId).update({"note": note.text});

        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) => ViewNote(categoryId: widget.cateogryDocId)),
        );
      } catch (e) {
        if (!mounted) return;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: "Error $e",
        ).show();
      } finally {
        if (mounted) {
          isLoading = false;
          setState(() {});
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    note.text = widget.oldValue;
  }

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note")),
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
                      editNote();
                    },

                    title: "Save",
                  ),
                ],
              ),
      ),
    );
  }
}
