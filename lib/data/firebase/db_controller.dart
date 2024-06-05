import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:terra_treasures/model/user_model.dart';

class DbController {
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

  Future<void> fetchSingleUserData(String id) async {
    final snapshot = await db.collection("user").doc(id).get();
    singleUserData = UserModel.fromMap(snapshot.data()!);
  }

  
}
