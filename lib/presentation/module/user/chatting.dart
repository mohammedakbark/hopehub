import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/message_model.dart';
import 'package:hopehub/data/firebase/communication_controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/doctor/doctor_report_page.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
// import 'package:hopehub/user/giverat.dart';
import 'package:quickalert/quickalert.dart';

class chatting extends StatefulWidget {
  bool isMentor;
  String receiverId;
  String userCollection;
  String? bookingId;
  String sessionId;
  String doctorId;
  String userId;
  chatting(
      {super.key,
      required this.isMentor,
      required this.sessionId,
      required this.doctorId,
      required this.userId,
      required this.receiverId,
      required this.userCollection,
      this.bookingId});

  @override
  State<chatting> createState() => _chattingState();
}

class _chattingState extends State<chatting> {
  final _controller = TextEditingController();
  Map<String, dynamic>? data;
  num? totalRating;
  ratingDiologue() {
    return showDialog(
        context: context,
        builder: (context) => FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("doctor")
                .doc(widget.receiverId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AlertDialog(
                actions: [
                  RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rate) async {
                        totalRating = rate + snapshot.data!.data()!["rating"];
                      }),
                  TextButton(
                      onPressed: () async {
                        if (totalRating != null) {
                          // log(totalRating.toString());
                          try {
                            await FirebaseFirestore.instance
                                .collection("doctor")
                                .doc(widget.receiverId)
                                .update({"rating": totalRating}).then((value) {
                              final pop = Navigator.of(context);
                              pop.pop();
                              pop.pop();
                            });
                          } catch (e) {
                            CSnackBar.showErrorSnack(context, e.toString());
                          }
                        } else {
                          final pop = Navigator.of(context);
                          pop.pop();
                          pop.pop();
                        }
                      },
                      child: const Text("Submit"))
                ],
                title: Text(
                  "Enter Your Rating",
                  style: GoogleFonts.inknutAntiqua(fontSize: 20),
                ),
              );
            }));
  }

  navigate() {}

  onpop() {
    if (widget.userCollection == "user" || widget.userCollection == "mentor") {
      return Navigator.pop(context);
    }
    return ratingDiologue();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onpop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 80,
          leading: Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    onPressed: () {
                      onpop();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 40,
                    ),
                  ))),

          title: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection(widget.userCollection)
                  .doc(widget.receiverId)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center();
                }
                if (widget.userCollection == "user") {
                  data = snapshot.data!.data() as Map<String, dynamic>;
                }
                if (widget.userCollection == "mentor") {
                  data = snapshot.data!.data() as Map<String, dynamic>;
                }
                if (widget.userCollection == "doctor") {
                  data = snapshot.data!.data() as Map<String, dynamic>;
                }
                return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                widget.userCollection == "mentor"
                                    ? data!["profile"]
                                    : data!["imageUrl"]),
                          ),
                        ),
                        Text(
                          data!["name"],
                          style: GoogleFonts.inknutAntiqua(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ));
              }),
          actions: [
            widget.bookingId != null
                ? TextButton(
                    onPressed: () {
                      if (widget.isMentor == true) {
                        DbController()
                            .getTotolaSesstion(widget.sessionId)
                            .then((value) {
                          DbController().reduceSessionByMentor(
                              widget.sessionId,
                              value - 1,
                              widget.doctorId,
                              widget.bookingId,
                              widget.userId);

                          CommunicationController().deleteRoomId(widget.userId);
                          Navigator.pop(context);
                          log(value.toString());
                        });
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReportPage(
                                  patientId: widget.receiverId,
                                  bookId: widget.bookingId!,
                                )));
                      }
                    },
                    child: const Text("Prescription"))
                : SizedBox()
          ],
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(right: 100),
          //     // child: Icon(Icons.chat_outlined),
          //   ),Text("Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)
          //  ],
        ),
        backgroundColor: Colors.grey[850],
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<QuerySnapshot>(
              stream: CommunicationController().getMessage(
                  FirebaseAuth.instance.currentUser!.uid, widget.receiverId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<MessageModel> messages = snapshot.data!.docs
                    .map((e) =>
                        MessageModel.fromJson(e.data() as Map<String, dynamic>))
                    .toList();
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemCount: messages.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemBuilder: (context, index) {
                        return _buildMessage(messages[index]);
                      });
                } else {
                  return const SizedBox();
                }
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.grey[800],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.keyboard,
                  color: Colors.white,
                  size: 30.0, // Explicitly use double for clarity
                ),
                const SizedBox(
                    width: 10.0), // Add spacing between icon and text field
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: GoogleFonts.inknutAntiqua(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        CommunicationController()
                            .sendMessage(widget.receiverId, _controller.text);
                        _controller.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMessage(MessageModel messageModel) {
    bool isMe = messageModel.senderID == FirebaseAuth.instance.currentUser!.uid;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(10),
          // height: 40,
          // width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.grey[800],
          ),
          child: Text(
            messageModel.message,
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
          )),
    );
  }
}
