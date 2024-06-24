import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/notification_model.dart';
import 'package:hopehub/data/Model/prescription.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/booking_controller.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/user/boo.dart';
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

  Future updayeStatus(bookingId, patientId, newStatus, doctorId) async {
    db
        .collection('doctor')
        .doc(doctorId)
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
        // .where("status", isEqualTo: "Accepted")
        .snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getSelectedbooking(
      bookinId, uid) {
    log(bookinId);
    log(FirebaseAuth.instance.currentUser!.uid);
    return db
        .collection('user')
        .doc(uid)
        .collection('bookings')
        .doc(bookinId)
        .get();
  }

  Stream<QuerySnapshot> getRejectedBooking() {
    return db
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookings')
        .where("status", isEqualTo: "Rejected")
        .snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCurrentDoctorMentors() async {
    return db
        .collection("mentor")
        .where("doctorId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  //-----------------Doctor assign  patient to  a mentor

  assignAPatientToMentor(SessionModel sessionModel) async {
    final docs = db.collection("Sessions").doc();

    await docs.set(sessionModel.toJson(docs.id));
  }

  Stream<QuerySnapshot> fetchAssignedSessionForDoctor() {
    return db
        .collection("Sessions")
        .where("doctorId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> fetchAssignedSessionForMentor() {
    return db
        .collection("Sessions")
        .where("mentroId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getPrescriptionFormntor() {
    return db
        .collection("Sessions")
        .where("mentroId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("status", isEqualTo: "Accepted")
        .snapshots();
  }

  Stream<QuerySnapshot> getPrescriptionForUser() {
    return db
        .collection("Sessions")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .where("status", isEqualTo: "Accepted")
        .snapshots();
  }

//=================================//==================
  deleteBooking(docId, uid, bookId) {
    db
        .collection('doctor')
        .doc(docId)
        .collection('bookings')
        .doc(bookId)
        .delete();
    db.collection('user').doc(uid).collection('bookings').doc(bookId).delete();
  }

  // mentor

  Future<DocumentSnapshot> getSelectedMentor(id) {
    return db.collection("mentor").doc(id).get();
  }

  Future<DocumentSnapshot> getSelectedDoctor(id) {
    return db.collection("doctor").doc(id).get();
  }

  Future addNotificationToDr(id, NotificationModel notificationModel) async {
    final doc =
        db.collection("doctor").doc(id).collection("Notification").doc();
    doc.set(notificationModel.toJosn(doc.id));
  }

  Stream<QuerySnapshot> fetchDrnoticiation() {
    return db.collection("doctor").snapshots();
  }

  deleteSessionOfMentorByMentor(id) {
    db.collection("Sessions").doc(id).delete();
  }

  updateSessionStatus(id, newStatus) {
    db.collection("Sessions").doc(id).update({"status": newStatus});
  }

  //----------------------User Mentor Handlings
  Stream<QuerySnapshot> getSelectedUserSession() {
    return db.collection("Sessions").snapshots();
  }

  cancelSessionOfMentorbyUser(SessionModel sessionModel) {
    updayeStatus(sessionModel.bookingId, sessionModel.uid, "Accepted",
            sessionModel.doctorId)
        .then((value) {
      deleteSessionOfMentorByMentor(sessionModel.sessionId);
    });
  }

  Future updatePaymentOFMentor(id) async {
    db.collection("Sessions").doc(id).update({"paymentStatus": true});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> chechSessionIsPayed(id) async {
    return db.collection("Sessions").doc(id).get();
  }

  //-------------------Reduce session

  Future getTotolaSesstion(id) async {
    final snapshot = await db.collection("Sessions").doc(id).get();
    if (!snapshot.exists) return;
    return snapshot.data()!["totalSession"];
  }

  reduceSessionByMentor(id, int session, doctorId, bookingId, userId) {
    if (session == 0) {
      db.collection("Sessions").doc(id).delete();
      db
          .collection('doctor')
          .doc(doctorId)
          .collection('bookings')
          .doc(bookingId)
          .delete();
      db
          .collection('user')
          .doc(userId)
          .collection('bookings')
          .doc(bookingId)
          .delete();
    } else {
      db.collection("Sessions").doc(id).update({"totalSession": session});
    }
  }

  sendRequestToMentorFromUser(
    toId,
  ) {
    NotificationModel model = NotificationModel(
        from: "User",
        fromId: FirebaseAuth.instance.currentUser!.uid,
        message: "you have a request for Session",
        to: "Mentor",
        toId: toId);
    db
        .collection("Request")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(model.toJosn(FirebaseAuth.instance.currentUser!.uid));
  }

  Stream<DocumentSnapshot> checkIsAlreadyRequested() {
    return db
        .collection("Request")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Stream<DocumentSnapshot> getRequest(docIc) {
    return db.collection("Request").doc(docIc).snapshots();
  }

  deleteSession(docIc) {
    return db.collection("Request").doc(docIc).delete();
  }

  addToPrescription(PrescriptionModel model) {
    final doc = db.collection("Prescription").doc();
    doc.set(model.toJson(doc.id));
  }

 Stream<QuerySnapshot> getMyPrescription(String where,String id) {
    return db.collection("Prescription").where(where,isEqualTo: id).snapshots();
  }
}



// await firebaseFirestore
//         .collection('user')
//         .doc(auth.currentUser!.uid)
//         .collection('bookings')
//         .doc(newBooking.bookingStart.toString())
//         .set(_bookingModel!.toMap()); 