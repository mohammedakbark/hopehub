import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hopehub/data/Model/message_model.dart';
import 'package:hopehub/data/Model/room_id_model.dart';

class CommunicationController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  sendMessage(
    receiverId,
    String message,
  ) async {
    final senderEmailId = auth.currentUser!.email;
    final String currentUserId = auth.currentUser!.uid;
    final Timestamp timestap = Timestamp.now();

    MessageModel _message = MessageModel(
        message: message,
        receiverID: receiverId,
        senderEmail: senderEmailId!,
        senderID: currentUserId,
        timeStamp: timestap);

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join('_');

    await db
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("message")
        .add(_message.toJson());
  }

  Stream<QuerySnapshot> getMessage(userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatroomId = ids.join('_');

    return db
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("message")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }

  //---------------------------------------------------------Vedio Call

  addRoomIds(RoomId roomId) {
    db.collection("RoomIds").doc(roomId.uid).set(roomId.toJson());
  }

  deleteRoomId(userid) {
    db.collection("RoomIds").doc(userid).delete();
  }

 Stream<DocumentSnapshot<Map<String,dynamic>>> getRoomIdForCurrentUser() {
    return db.collection("RoomIds").doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }
}
