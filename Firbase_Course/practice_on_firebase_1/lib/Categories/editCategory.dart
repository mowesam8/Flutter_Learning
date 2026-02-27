import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/pages/home.dart';

class Editcategory extends StatefulWidget {
  const Editcategory({super.key, required this.docId, required this.oldName});
  final String docId;
  final String oldName;

  @override
  State<Editcategory> createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference categories = FirebaseFirestore.instance.collection(
    'categories',
  );

  bool isLoading = false;

  editCategory() async {
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});

        await categories.doc(widget.docId).update({"name": name.text});

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => Home()),
          (route) => false,
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
  void initState() {
    super.initState();
    name.text = widget.oldName;
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Category")),
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
                      hintText: "Enter Name",
                      controller: name,
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
                      editCategory();
                    },

                    title: "Edit",
                  ),
                ],
              ),
      ),
    );
  }
}
