import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/room_id_model.dart';
import 'package:hopehub/data/firebase/communication_controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/widget/room/room.dart';
import 'package:http/http.dart' as http;

//Auth token we will use to generate a meeting and connect to it
String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiIwMjY0NTI5YS0yODgyLTQ2NGEtYWQ3ZC01OTI2NzcxYzAyMTYiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODQzNjMyMSwiZXhwIjoxNzQ5OTcyMzIxfQ.qZhgWLszkZrQ0tymq94khfbaN_2S08Le1FmgCzaKB9E";

// API call to create meeting
Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

//Destructuring the roomId from the response
  return json.decode(httpResponse.body)['roomId'];
}

void onCreateButtonPressed(BuildContext context, String userId,String bookingId,bool isMentor,sessionId,doctorId) async {
  // call api to create meeting and then navigate to MeetingScreen with meetingId,token
  await createMeeting().then((meetingId) {
    if (!context.mounted) return;
    // DbController().addNotificationToDr(id, notificationModel)
    CommunicationController().addRoomIds(RoomId(
        anotherUserId: FirebaseAuth.instance.currentUser!.uid,
        token: meetingId,
        uid: userId));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MeetingScreen(
          doctorId:doctorId ,
          sessionId:sessionId ,
          isMentor: isMentor,
          bookingId:bookingId ,
          isUser: false,
          userId: userId,
          meetingId: meetingId,
          token: token,
        ),
      ),
    );
  });
}
