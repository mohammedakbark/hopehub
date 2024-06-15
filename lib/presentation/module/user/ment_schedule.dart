import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/user/chatting.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/user/connection.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/notification.dart';

import 'package:hopehub/presentation/module/user/page_profilepage.dart';
import 'package:hopehub/presentation/module/user/feedback.dart';
import 'package:hopehub/presentation/module/user/payment_screen.dart';
import 'package:hopehub/presentation/module/user/settings.dart';
import 'package:hopehub/presentation/widget/room/joinscreen.dart';

class MenterSchedulePAge extends StatefulWidget {
  SessionModel sessionModel;
  MenterSchedulePAge({super.key, required this.sessionModel});

  @override
  State<MenterSchedulePAge> createState() => _MenterSchedulePAgeState();
}

class _MenterSchedulePAgeState extends State<MenterSchedulePAge> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DbController().getSelectedMentor(widget.sessionModel.mentroId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          MentorModel mentorModel = MentorModel.fromData(
              snapshot.data!.data() as Map<String, dynamic>);
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
                width: 350,
                height: 300,
                // color: Colors.black,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                child: FutureBuilder(
                    future: DbController().getSelectedbooking(
                        widget.sessionModel.bookingId, widget.sessionModel.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center();
                      }
                      BookingModel bookingModel = BookingModel.fromMap(
                          snapshot.data!.data() as Map<String, dynamic>);
                      return Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        NetworkImage(mentorModel.profile),
                                  )
                                  // Image.asset("assets/mentor.jpg"),

                                  ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 10),
                                      child: Text(
                                        mentorModel.name,
                                        style: GoogleFonts.inknutAntiqua(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 36),
                                      child: Text(
                                          "Experience :${mentorModel.experience}",
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 42),
                                      child: Text(bookingModel.sessionMode,
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text("Today:",
                                    //         style: GoogleFonts.inknutAntiqua(
                                    //             color: Colors.white, fontSize: 15)),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(left: 10),
                                    //       child: Text("2.00 AM",
                                    //           style: GoogleFonts.inknutAntiqua(
                                    //               color: Colors.white, fontSize: 15)),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                              ),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Center(
                                      child: Container(
                                        width: 10,
                                        height: 1,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                  itemCount: widget.sessionModel.totalSession),
                            ),
                          ),
                          FutureBuilder(
                              future: DbController().chechSessionIsPayed(
                                  widget.sessionModel.sessionId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center();
                                }
                                if (snapshot.data!.data()!["paymentStatus"] ==
                                    true) {
                                  return ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  side: const BorderSide(
                                                      color: Colors.white))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.amber[900])),
                                      onPressed: () {
                                        if (bookingModel.sessionMode ==
                                            "Chat") {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (conetxt) =>
                                                      chatting(
                                                        isMentor: false,
                                                        doctorId: "",
                                                        sessionId: "",
                                                        userId: "",
                                                        userCollection:
                                                            "mentor",
                                                        receiverId: widget
                                                            .sessionModel
                                                            .mentroId,
                                                      )));
                                        }
                                        if (bookingModel.sessionMode ==
                                            "Call") {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (conetxt) =>
                                                      JoinScreen()));

//Call
                                        }

                                        if (bookingModel.sessionMode ==
                                            "Video Call") {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (conetxt) =>
                                                      JoinScreen()));
                                          // Video Call
                                        }
                                      },
                                      child: Text(
                                        "Go",
                                        style: GoogleFonts.inknutAntiqua(
                                            color: Colors.white, fontSize: 10),
                                      ));
                                }
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 60, top: 20),
                                      child: SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        side: const BorderSide(
                                                            color:
                                                                Colors.white))),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.amber[900])),
                                            onPressed: () {
                                              // DbController()
                                              //     .chechSessionIsPayed(
                                              //         widget.sessionModel.sessionId)
                                              //     .then((value) {
                                              //   if (value.data()!["paymentStatus"] ==
                                              //       false) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PaymentPage(
                                                            isPaymentForMentor:
                                                                true,
                                                            sessionModel: widget
                                                                .sessionModel,
                                                          )));

                                              // } else {

                                              // }
                                              // });
                                            },
                                            child: Text(
                                              "Confirm",
                                              style: GoogleFonts.inknutAntiqua(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        side: const BorderSide(
                                                            color:
                                                                Colors.white))),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.amber[900])),
                                            onPressed: () {
                                              DbController()
                                                  .cancelSessionOfMentorbyUser(
                                                      widget.sessionModel);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: GoogleFonts.inknutAntiqua(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            )),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      );
                    })),
          );
        });
  }
}
