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
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller  {
  var _storage = FirebaseStorage.instance;
  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }


  
  Future<XFile?> pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.camera  ,
    );
  }

  Future<String> uploadImage(String path,File imageFile) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = _storage.ref().child('$path/${imageFile.path}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path), metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

  // SLOTE BOOKING.................2.....

  Future<bool> requestPermissions() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    status = await Permission.storage.request();
  }
  return status.isGranted;
}

// Future<void> downloadImage(String imageUrl, String fileName) async {
//   bool hasPermissions = await requestPermissions();
//   if (!hasPermissions) {
//     print("Permissions not granted");
//     return;
//   }

//   var dio = 

//   try {
//     // Get the application documents directory
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String appDocPath = appDocDir.path;

//     // Create the full file path
//     String filePath = '$appDocPath/$fileName';

//     // Download the image
//     await dio.download(imageUrl, filePath);

//     print('Image downloaded to $filePath');
//   } catch (e) {
//     print('Error downloading image: $e');
//   }
// }

 
}
