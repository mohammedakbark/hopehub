import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:image_picker/image_picker.dart';

class AdminController {
  final db = FirebaseFirestore.instance;

  Future<void> addDr(
    Drmodel drmodel,
    String uid,
  ) async {
    final docRef = db.collection("doctor").doc(uid);
    await docRef.set(drmodel.toMap(docRef.id));
    fetchAllDr();
  }

  Future<void> create(
      String name,
      String qualification,
      String expert,
      String language,
      String phone,
      String email,
      String password,
      String id,
      String imageurl) async {
    final collectionRef = FirebaseFirestore.instance.collection('doctor');
    await collectionRef.add({
      "name": name,
      "qualification": qualification,
      "expert": expert,
      "language": language,
      "phone": phone,
      "email": email,
      "password": password,
      "imageUrl": imageurl,
      "id": id
    });
  }
  // final id=FirebaseAuth.instance.currentUser!.uid;
  // final drId=docRef.id;
  // awai

  List<Drmodel> listOfData = [];

  Future<List<Drmodel>> fetchAllDr() async {
    final snapshot = await db.collection("doctor").get();
    listOfData = snapshot.docs.map((e) => Drmodel.fromMap(e.data())).toList();
    print(listOfData);
    return listOfData;
  }

  Drmodel? singleDoctorData;

  Future<void> fetchSingleDoctorData(String id) async {
    final snapshot = await db.collection("doctor").doc(id).get();
    singleDoctorData = Drmodel.fromMap(snapshot.data()!);
  }

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<String> uploadImage(File imageFile) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image.jpeg');
    final storageRef =
        FirebaseStorage.instance.ref().child('images/${imageFile.path}');
    try {
      final uploadTask = storageRef.putFile(imageFile,metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

   Future addMentor(MentorModel mentorModel,uid)async{
    final mentRef=db.collection('mentor').doc(uid);
    mentRef.set(mentorModel.data(mentRef.id));
  }
  MentorModel?singleMentorData;
  Future fetchSingleMentor(id)async{
    final snapshot=await db.collection("mentor").doc(id)
    .get();
    singleMentorData=MentorModel.fromData(snapshot.data()!);
  }
}
