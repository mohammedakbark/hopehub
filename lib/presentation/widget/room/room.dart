import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/firebase/communication_controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/doctor/doctor_report_page.dart';
import 'package:hopehub/presentation/widget/room/meeting_buttons.dart';
import 'package:hopehub/presentation/widget/room/participent.dart';
import 'package:videosdk/videosdk.dart';

class MeetingScreen extends StatefulWidget {
  final String meetingId;
  final String token;
  final String userId;
  final String bookingId; // for doctor module
  final String? sessionId; // for mentor module
    final String? doctorId; // for mentor module
  bool isUser; //for user module
  bool isMentor; //for mentor module

  MeetingScreen(
      {super.key,
      required this.doctorId,
      required this.sessionId,
      required this.isMentor,
      required this.bookingId,
      required this.isUser,
      required this.userId,
      required this.meetingId,
      required this.token});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  late Room _room;
  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    // create room
    _room = VideoSDK.createRoom(
        roomId: widget.meetingId,
        token: widget.token,
        displayName: "John Doe",
        micEnabled: micEnabled,
        camEnabled: camEnabled,
        defaultCameraIndex: kIsWeb
            ? 0
            : 1 // Index of MediaDevices will be used to set default camera
        );

    setMeetingEventListener();

    // Join room
    _room.join();

    super.initState();
  }

  // listening to meeting events
  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
            _room.localParticipant.id, () => _room.localParticipant);
      });
    });

    _room.on(
      Events.participantJoined,
      (Participant participant) {
        setState(
          () => participants.putIfAbsent(participant.id, () => participant),
        );
      },
    );

    _room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });

    _room.on(Events.roomLeft, () {
      participants.clear();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  // onbackButton pressed leave the room
  Future<bool> _onWillPop() async {
    _room.leave();
    return true;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('VideoSDK QuickStart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.meetingId),
              //render all participant
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 300,
                    ),
                    itemBuilder: (context, index) {
                      return ParticipantTile(
                          key: Key(participants.values.elementAt(index).id),
                          participant: participants.values.elementAt(index));
                    },
                    itemCount: participants.length,
                  ),
                ),
              ),
              MeetingControls(
                onToggleMicButtonPressed: () {
                  micEnabled ? _room.muteMic() : _room.unmuteMic();
                  micEnabled = !micEnabled;
                },
                onToggleCameraButtonPressed: () {
                  camEnabled ? _room.disableCam() : _room.enableCam();
                  camEnabled = !camEnabled;
                },
                onLeaveButtonPressed: () {
                  if (widget.isUser == false) {
                    if (widget.isMentor == true) {
                      DbController()
                          .getTotolaSesstion(widget.sessionId)
                          .then((value) {
                        DbController()
                            .reduceSessionByMentor(widget.sessionId, value - 1,widget.doctorId,widget.bookingId,widget.userId);

                        CommunicationController().deleteRoomId(widget.userId);
                        Navigator.pop(context);
                        log(value.toString());
                      });

                      // DbController().updateSessionStatus();
                      // // _room.disableCam();

                      // // _room.leave();
                      // Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ReportPage(
                                patientId: widget.userId,
                                bookId: widget.bookingId,
                              )));
                      CommunicationController().deleteRoomId(widget.userId);
                    }
                  } else if (widget.isUser == true) {
                    CommunicationController().deleteRoomId(widget.userId);
                    // _room.disableCam();

                    // _room.leave();
                    Navigator.of(context).pop();
                  }

                  // _room.end();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _room.disableCam();

    // TODO: implement dispose
    super.dispose();
  }
}
