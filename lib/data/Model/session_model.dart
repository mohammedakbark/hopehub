import 'package:flutter/material.dart';

class SessionModel {
  String? sessionId;
  String uid;
  String mentroId;
  String doctorId;
  String presctiption;
  int totalSession;
  String status;
  bool paymentStatus;
  String bookingId;

  SessionModel(
      {required this.doctorId,
      required this.mentroId,
      required this.bookingId,
      required this.paymentStatus,
      required this.presctiption,
      this.sessionId,
      required this.status,
      required this.totalSession,
      required this.uid});

  Map<String, dynamic> toJson(id) => {
        "doctorId": doctorId,
        "bookingId":bookingId,
        "mentroId": mentroId,
        "paymentStatus": paymentStatus,
        "presctiption": presctiption,
        "sessionId": id,
        "status": status,
        "totalSession": totalSession,
        "uid": uid
      };

  factory SessionModel.fromjson(Map<String, dynamic> json) {
    return SessionModel(
      bookingId:json["bookingId"],
        doctorId: json["doctorId"],
        mentroId: json["mentroId"],
        paymentStatus: json["paymentStatus"],
        presctiption: json["presctiption"],
        sessionId: json["sessionId"],
        status: json["status"],
        totalSession: json["totalSession"],
        uid: json["uid"]);
  }
}
