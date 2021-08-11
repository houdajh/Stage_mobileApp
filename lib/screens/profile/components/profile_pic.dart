import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';

String ref = FirebaseAuth.instance.currentUser.uid + '.jpg';
String image = "";

class ProfilePic extends StatefulWidget {
  ProfilePic({Key key}) : super(key: key);
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File imageP = File("assets/images/Profile Image.png");
  uploadImage() async {
    final ref = FirebaseStorage.instance
        .ref('profileImage')
        .child(FirebaseAuth.instance.currentUser.uid + '.jpg');
    ref.putFile(imageP);
    final url = await ref.getDownloadURL();
    setState(() {
      image = url;
    });

    print(image);
  }

  final imagePicker = ImagePicker();
  _updateProfile() async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("users");
    await usersRef.doc(FirebaseAuth.instance.currentUser.uid).update({
      "profileImage": image,
    });
    print("profile apdated");
  }

  _openGallery() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageP = File(pickedImage.path);
        uploadImage();
        _updateProfile();
      });
    } else {}
  }

  _openCamera() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imageP = File(pickedImage.path);
        uploadImage();
        _updateProfile();
      });
    } else {}
  }

  getImage() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    setState(() {
      image = userData['profileImage'];
    });
    print(image);
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Profile photo"),
            content: SingleChildScrollView(
                child: ListBody(children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: () {
                  _openGallery();
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera();
                  }),
            ])),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(image)),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () async {
                 // await getImage();
                  print("==================================");
                  print(image);
                  await showChoiceDialog(context);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
