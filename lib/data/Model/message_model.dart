import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String senderID;
  String senderEmail;
  String receiverID;
  String message;
  Timestamp timeStamp;

  MessageModel(
      {required this.message,
      required this.receiverID,
      required this.senderEmail,
      required this.senderID,
      required this.timeStamp});

  Map<String, dynamic> toJson() => {
        "message": message,
        "receiverID": receiverID,
        "senderEmail": senderEmail,
        "senderID": senderID,
        "timeStamp": timeStamp,
      };

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        message: json["message"],
        receiverID: json["receiverID"],
        senderEmail: json["senderEmail"],
        senderID: json["senderID"],
        timeStamp: json["timeStamp"]);
  }
}
