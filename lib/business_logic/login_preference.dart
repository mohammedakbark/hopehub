import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference {
    final db = FirebaseFirestore.instance;

  static setPreference(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("uid", uid);
  }

  static Future<String> getPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String prefereceString = prefs.getString("uid") ?? '';
    return prefereceString;
  }

  static clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('uid');
  }



  checkTheUser(loginId,context) async {
  final doctorCollection= await db.collection("doctor").doc(loginId).get();
    final userCollection= await db.collection("user").doc(loginId).get();
  final mentorCollection= await db.collection("mentor").doc(loginId).get();

  if(doctorCollection.exists){
     Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>drhome()),
              (route) => false);
  }
  if(userCollection.exists){
     Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => packages(
                        indexnum: 0,
                      )),
              (route) => false);
  }
  if(mentorCollection.exists){
     Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>menthome()),
              (route) => false);

  }

  }
}
