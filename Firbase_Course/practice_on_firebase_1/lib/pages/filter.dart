import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilterFirestore extends StatefulWidget {
  const FilterFirestore({super.key});

  @override
  State<FilterFirestore> createState() => _FilterFirestoreState();
}

class _FilterFirestoreState extends State<FilterFirestore> {
  File? file;

  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageCamera = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (imageCamera != null) {
      setState(() {
        file = File(imageCamera.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter")),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                await getImage();
              },

              child: Text("Get Image Camera"),
            ),

            if (file != null) Center(child: Image.file(file!, width: 200,)),
          ],
        ),
      ),
    );
  }
}
