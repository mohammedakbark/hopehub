import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:terra_treasures/model/user_model.dart';

class DbController with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel, String uid) async {
    final docRef = db.collection("user").doc(uid);
    await docRef.set(userModel.toMap(docRef.id));
    fetchAllUser();
  }

  Future<void> create(String name, String email, String phoneNumber,
      String address, String imageUrl) async {
    final collectionRef = FirebaseFirestore.instance.collection('user');
    await collectionRef.add({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'imageUrl': imageUrl,
    });
  }

  List<UserModel> listOfData = [];

  Future<List<UserModel>> fetchAllUser() async {
    final snapshot = await db.collection("user").get();
    listOfData = snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(listOfData);
    return listOfData;
  }

  UserModel? singleUserData;

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchSingleUserData(
      String id) async {
    final snapshot = await db.collection("user").doc(id).get();
    singleUserData = UserModel.fromMap(snapshot.data()!);
    return snapshot;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUSerData(String id) {
    return db.collection("user").doc(id).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDoctorData(String id) {
    return db.collection("doctor").doc(id).snapshots();
  }

  cancelMyBooking(bookingId, doctorId) async {
    db
        .collection('doctor')
        .doc(doctorId)
        .collection('bookings')
        .doc(bookingId)
        .delete();
    db
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .doc(bookingId)
        .delete();
  }
  //=====================DOCTOR

  Stream<QuerySnapshot> getBooking() {
    return db
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .where("status", isNotEqualTo: "Rejected")
        .snapshots();
  }

  updayeStatus(bookingId, patientId, newStatus) {
    db
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .doc(bookingId)
        .update({"status": newStatus});
    db
        .collection('user')
        .doc(patientId)
        .collection('bookings')
        .doc(bookingId)
        .update({"status": newStatus});
  }

  Stream<QuerySnapshot> getbookedSchedulesforUser() {
    return db
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .where("status", isEqualTo: "Accepted")
        .snapshots();
  }

 Stream<QuerySnapshot>  getRejectedBooking(){
   return db
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .where("status", isEqualTo: "Rejected")
        .snapshots();

 }
}



// await firebaseFirestore
//         .collection('user')
//         .doc(auth.currentUser!.uid)
//         .collection('bookings')
//         .doc(newBooking.bookingStart.toString())
//         .set(_bookingModel!.toMap()); 