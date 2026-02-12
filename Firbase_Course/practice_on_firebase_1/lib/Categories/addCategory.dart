import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  addCategory() async {
    if (formState.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add({"name": name.text});

        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (c) => Home()));
      } catch (e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: "Error $e",
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      body: Form(
        key: formState,
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
