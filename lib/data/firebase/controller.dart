import 'dart:developer';
import 'dart:io';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Controller  {
  var _storage = FirebaseStorage.instance;
  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<String> uploadImage(File imageFile) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = _storage.ref().child('images/${imageFile.path}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path), metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

  // SLOTE BOOKING......................
 
}
