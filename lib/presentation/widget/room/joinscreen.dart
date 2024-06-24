import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/firebase/communication_controller.dart';
import 'package:hopehub/presentation/widget/room/room.dart';
import 'package:hopehub/presentation/widget/room/api_controller.dart';

class JoinScreen extends StatelessWidget {
  bool iscall;
  bool isMeetWithMentor;
  final _meetingIdController = TextEditingController();

  JoinScreen({super.key, required this.iscall,required this.isMeetWithMentor});

  void onJoinButtonPressed(BuildContext context) {
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to MeetingScreen with meetingId,token
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            isCall: iscall,
            doctorId: "N/A",
            sessionId: "N/A",
            isMentor: false,
            bookingId: "N/A",
            isUser: true,
            userId: FirebaseAuth.instance.currentUser!.uid,
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid meeting id"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: CommunicationController().getRoomIdForCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.exists) {
              _meetingIdController.text = snapshot.data!.data()!["token"];
            }

            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () => onCreateButtonPressed(context),
                    //   child: const Text('Create Meeting'),
                    // ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Meeting Id',
                          border: OutlineInputBorder(),
                        ),
                        controller: _meetingIdController,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => onJoinButtonPressed(context),
                      child: const Text('Join Meeting'),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
