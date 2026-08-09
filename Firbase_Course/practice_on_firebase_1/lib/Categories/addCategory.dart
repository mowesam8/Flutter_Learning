import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';
import 'package:practice_on_firebase_1/Custom/Custom_Button.dart';
import 'package:practice_on_firebase_1/Custom/Custom_TextField.dart';
import 'package:practice_on_firebase_1/pages/home.dart';

class Addcategory extends StatefulWidget {
  const Addcategory({super.key});

  @override
  State<Addcategory> createState() => _AddcategoryState();
}

class _AddcategoryState extends State<Addcategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference categories = FirebaseFirestore.instance.collection(
    'categories',
  );

  bool isLoading = false;

  addCategory() async {
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});

        await categories.add({
          "name": name.text,
          "id": FirebaseAuth.instance.currentUser!.uid,
        });

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
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
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
                      labelText: "Category Name",
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
                      addCategory();
                    },

                    title: "Add",
                  ),
                ],
              ),
      ),
    );
  }
}
