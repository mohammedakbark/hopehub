import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/firebase/communication_controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/doctor/doctor_report_page.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:hopehub/presentation/widget/rating_bar.dart';
import 'package:hopehub/presentation/widget/room/meeting_buttons.dart';
import 'package:hopehub/presentation/widget/room/participent.dart';
import 'package:videosdk/videosdk.dart';

class MeetingScreen extends StatefulWidget {
  bool isCall;
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
      required this.isCall,
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
  bool micEnabled = true;
  bool camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    // create room
    _room = VideoSDK.createRoom(
        roomId: widget.meetingId,
        token: widget.token,
        displayName: "John Doe",
        micEnabled: micEnabled,
        camEnabled: widget.isCall == true ? false : camEnabled,
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
  // void setMeetingEventListener() {
  //   _room.on(Events.roomJoined, () {
  //     setState(() {
  //       participants.putIfAbsent(
  //           _room.localParticipant.id, () => _room.localParticipant);
  //     });
  //   });

  //   _room.on(
  //     Events.participantJoined,
  //     (Participant participant) {
  //       setState(
  //         () => participants.putIfAbsent(participant.id, () => participant),
  //       );
  //     },
  //   );

  //   _room.on(Events.participantLeft, (String participantId) {
  //     if (participants.containsKey(participantId)) {
  //       setState(
  //         () => participants.remove(participantId),
  //       );
  //     }
  //   });

  //   _room.on(Events.roomLeft, () {
  //     participants.clear();
  //     Navigator.popUntil(context, ModalRoute.withName('/'));
  //   });
  // }

  void setMeetingEventListener() {
    _room.on(Events.roomJoined, _onRoomJoined);
    _room.on(Events.participantJoined, _onParticipantJoined);
    _room.on(Events.participantLeft, _onParticipantLeft);
    _room.on(Events.roomLeft, _onRoomLeft);
    _room.on(Events.error, _onError);
  }

  void _onRoomJoined() {
    setState(() {
      participants.putIfAbsent(
          _room.localParticipant.id, () => _room.localParticipant);
    });
    log('Room joined');
  }

  void _onParticipantJoined(Participant participant) {
    setState(() => participants.putIfAbsent(participant.id, () => participant));
    log('Participant joined: ${participant.id}');
  }

  void _onParticipantLeft(String participantId) {
    if (participants.containsKey(participantId)) {
      setState(() => participants.remove(participantId));
    }
    log('Participant left: $participantId');
  }

  void _onRoomLeft() {
    participants.clear();
    log('Room left');
    if (mounted) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  void _onError(error) {
    log('Error: $error');
    if (mounted) {
      CSnackBar.showErrorSnack(context, "Error: $error");
    }
  }

  // onbackButton pressed leave the room
  Future<bool> _onWillPop() async {
    await leave();

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
                  if (widget.isCall == false) {
                    camEnabled ? _room.disableCam() : _room.enableCam();
                    camEnabled = !camEnabled;
                  }
                },
                onLeaveButtonPressed: () async {
                  if (widget.isUser == false) {
                    if (widget.isMentor == true) {
                      return _leaveRoomMentor();
                    } else {
                      return _leaveRoomDoctor();
                    }
                  } else if (widget.isUser == true) {
                    return _leaveRoomUser();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future leave() async {
    try {
      // _room.leave();
      await _room.disableCam();
      await _room.muteMic();
      // _room.end();
      await CommunicationController().deleteRoomId(widget.userId);
    } catch (e) {
      log("Error while leaving the room: $e");
      CSnackBar.showErrorSnack(context, "Error while leaving the room: $e");
    }
  }

  // num ?totalRating;
  // ratingDiologue() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => FutureBuilder(
  //           future: FirebaseFirestore.instance
  //               .collection("doctor")
  //               .doc(widget.receiverId)
  //               .get(),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             }
  //             return AlertDialog(
  //               actions: [
  //                 RatingBar.builder(
  //                     initialRating: 0,
  //                     minRating: 1,
  //                     direction: Axis.horizontal,
  //                     allowHalfRating: true,
  //                     itemCount: 5,
  //                     itemPadding: const EdgeInsets.symmetric(horizontal: 4),
  //                     itemBuilder: (context, _) => const Icon(
  //                           Icons.star,
  //                           color: Colors.amber,
  //                         ),
  //                     onRatingUpdate: (rate) async {
  //                       totalRating = rate + snapshot.data!.data()!["rating"];
  //                     }),
  //                 TextButton(
  //                     onPressed: () async {
  //                       if (totalRating != null) {
  //                         // log(totalRating.toString());
  //                         try {
  //                           await FirebaseFirestore.instance
  //                               .collection("doctor")
  //                               .doc(widget.receiverId)
  //                               .update({"rating": totalRating}).then((value) {
  //                             final pop = Navigator.of(context);
  //                             pop.pop();
  //                             pop.pop();
  //                           });
  //                         } catch (e) {
  //                           CSnackBar.showErrorSnack(context, e.toString());
  //                         }
  //                       } else {
  //                         final pop = Navigator.of(context);
  //                         pop.pop();
  //                         pop.pop();
  //                       }
  //                     },
  //                     child: const Text("Submit"))
  //               ],
  //               title: Text(
  //                 "Enter Your Rating",
  //                 style: GoogleFonts.inknutAntiqua(fontSize: 20),
  //               ),
  //             );
  //           }));
  // }

  Future<void> _leaveRoomUser() async {
    if (mounted) {
      // return ratingDiologue();

      await leave();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => packages(indexnum: 0)),
          (route) => false);
    }
  }

  _leaveRoomDoctor() async {
    if (mounted) {
      await leave();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ReportPage(
                patientId: widget.userId,
                bookId: widget.bookingId,
              )));
    }
  }

  _leaveRoomMentor() async {
    if (mounted) {
      await leave();
      DbController().getTotolaSesstion(widget.sessionId).then((value) {
        DbController().reduceSessionByMentor(widget.sessionId, value - 1,
            widget.doctorId, widget.bookingId, widget.userId);
      }).then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => menthome()),
            (route) => false);
      });
    }
  }

  @override
  void dispose() {
    leave();

    super.dispose();
  }
}
