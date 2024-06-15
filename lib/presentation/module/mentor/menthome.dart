import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/login_preference.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/Model/notification_model.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/mentor/mentro_drawer.dart';
import 'package:hopehub/presentation/module/user/boo.dart';
import 'package:hopehub/presentation/module/user/chatting.dart';

import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/mentor/mentpro.dart';
import 'package:hopehub/presentation/module/mentor/mentrepo.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';
import 'package:hopehub/presentation/widget/room/api_controller.dart';

class menthome extends StatefulWidget {
  const menthome({super.key});

  @override
  State<menthome> createState() => _menthomeState();
}

class _menthomeState extends State<menthome> {
  // BookingModel? booking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        drawer: MentorCusDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          // leading: Center(
          //   child: IconButton(onPressed: (){
          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
          //     }, icon: Icon(Icons.menu,color: Colors.white,))
          //   // Icon(
          //   //   Icons.menu,
          //   //   color: Colors.white,
          //   // ),
          // ),
          title: Text(
            "Home",
            style: GoogleFonts.inknutAntiqua(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const notifictn()));
              },
              icon: const Icon(
                Icons.notifications_on,
              ),
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              // child: Icon(Icons.chat_outlined),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Colors.white)),
                    labelText: "Search",
                    labelStyle: GoogleFonts.inknutAntiqua(
                        color: Colors.white.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white.withOpacity(0.5),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Available Schedule",
                style: GoogleFonts.inknutAntiqua(
                  color: Colors.amber[900],
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: DbController().fetchAssignedSessionForMentor(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<SessionModel> listOfSessions = snapshot.data!.docs
                        .map((e) => SessionModel.fromjson(
                            e.data() as Map<String, dynamic>))
                        .toList();
                    if (snapshot.hasData) {
                      return listOfSessions.isEmpty
                          ? Center(
                              child: Text("NO Sessions"),
                            )
                          : ListView.builder(
                              itemCount: listOfSessions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    // height: 220,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: FutureBuilder(
                                        future: DbController()
                                            .fetchSingleUserData(
                                                listOfSessions[index].uid),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          UserModel userData =
                                              UserModel.fromMap(
                                                  snapshot.data!.data()
                                                      as Map<String, dynamic>);
                                          return Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: SizedBox(
                                                  height: 220,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .4,
                                                  child: Image.network(
                                                    userData.imageUrl!,
                                                    scale: 1.3,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, bottom: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(
                                                        userData.name,
                                                        style: GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15),
                                                      ),
                                                    ),
                                                    Text(
                                                      userData.email,
                                                      style: GoogleFonts
                                                          .inknutAntiqua(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SizedBox(
                                                          width: 150,
                                                          child: Text(
                                                            userData.phone,
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15),
                                                          )),
                                                    ),
                                                    FutureBuilder<
                                                            DocumentSnapshot>(
                                                        future: DbController()
                                                            .getSelectedbooking(
                                                                listOfSessions[
                                                                        index]
                                                                    .bookingId,
                                                                listOfSessions[
                                                                        index]
                                                                    .uid),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            );
                                                          }
                                                          // log(snapshot.data!
                                                          //     .data()
                                                          //     .toString());
                                                          BookingModel booking =
                                                              BookingModel.fromMap(
                                                                  snapshot.data!
                                                                          .data()
                                                                      as Map<
                                                                          String,
                                                                          dynamic>);

                                                          return Text(
                                                            booking.sessionMode,
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15),
                                                          );
                                                        }),
                                                    FutureBuilder(
                                                        future: DbController()
                                                            .getSelectedDoctor(
                                                                listOfSessions[
                                                                        index]
                                                                    .doctorId),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return SizedBox();
                                                          }
                                                          Drmodel dr = Drmodel
                                                              .fromMap(snapshot
                                                                      .data!
                                                                      .data()
                                                                  as Map<String,
                                                                      dynamic>);
                                                          return Text(
                                                            "Prescribed by: Dr.${dr.name}",
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15),
                                                          );
                                                        }),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Row(
                                                        children: [
                                                          FutureBuilder<
                                                                  DocumentSnapshot>(
                                                              future: DbController().getSelectedbooking(
                                                                  listOfSessions[
                                                                          index]
                                                                      .bookingId,
                                                                  listOfSessions[
                                                                          index]
                                                                      .uid),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  );
                                                                }
                                                                // log(snapshot.data!
                                                                //     .data()
                                                                //     .toString());
                                                                BookingModel
                                                                    booking =
                                                                    BookingModel.fromMap(snapshot
                                                                            .data!
                                                                            .data()
                                                                        as Map<
                                                                            String,
                                                                            dynamic>);

                                                                return ElevatedButton(
                                                                    style: ButtonStyle(
                                                                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                7),
                                                                            side: const BorderSide(
                                                                                color: Colors
                                                                                    .white))),
                                                                        backgroundColor:
                                                                            MaterialStatePropertyAll(Colors.amber[
                                                                                900])),
                                                                    onPressed:
                                                                        () {
                                                                      if (listOfSessions[index]
                                                                              .status ==
                                                                          "assigned") {
                                                                        DbController().updateSessionStatus(
                                                                            listOfSessions[index].sessionId,
                                                                            "Accepted");
                                                                      } else {
                                                                        if (booking.sessionMode ==
                                                                            "Call") {
                                                                          onCreateButtonPressed(
                                                                              context,
                                                                              booking.userid,
                                                                              booking.bookingid,
                                                                              true,
                                                                              listOfSessions[index].sessionId,booking.doctorid);
                                                                        }
                                                                        if (booking.sessionMode ==
                                                                            "Video Call") {
                                                                          onCreateButtonPressed(
                                                                              context,
                                                                              booking.userid,
                                                                              booking.bookingid,
                                                                              true,
                                                                              listOfSessions[index].sessionId,booking.doctorid);
                                                                        }
                                                                        if (booking.sessionMode ==
                                                                            "Chat") {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => chatting(
                                                                                    isMentor: true,
                                                                                    doctorId: listOfSessions[index].doctorId,
                                                                                    sessionId: listOfSessions[index].sessionId!,
                                                                                    userId: listOfSessions[index].uid,
                                                                                        userCollection: "user",
                                                                                        receiverId: userData.id!,
                                                                                      )));
                                                                        }
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      listOfSessions[index].status ==
                                                                              "assigned"
                                                                          ? "Accept"
                                                                          : "Go",
                                                                      style: GoogleFonts.inknutAntiqua(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15),
                                                                    ));
                                                              }),
                                                          listOfSessions[index]
                                                                      .status ==
                                                                  "assigned"
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10),
                                                                  child: ElevatedButton(
                                                                      style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7), side: const BorderSide(color: Colors.white))), backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
                                                                      onPressed: () {
                                                                        DbController()
                                                                            .updayeStatus(
                                                                                listOfSessions[index].bookingId,
                                                                                listOfSessions[index].uid,
                                                                                "Accepted",
                                                                                FirebaseAuth.instance.currentUser!.uid)
                                                                            .then((value) {
                                                                          DbController()
                                                                              .addNotificationToDr(listOfSessions[index].doctorId, NotificationModel(from: "Mentor", fromId: FirebaseAuth.instance.currentUser!.uid, message: "Rejected the session ", to: listOfSessions[index].doctorId, toId: "Doctor"))
                                                                              .then((value) {
                                                                            DbController().deleteSessionOfMentorByMentor(listOfSessions[index].sessionId);
                                                                          });
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                        "Reject",
                                                                        style: GoogleFonts.inknutAntiqua(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      )),
                                                                )
                                                              : SizedBox()
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                );
                              },
                            );
                    } else {
                      return SizedBox();
                    }
                  }),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedItemColor: Colors.amber[900],
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.amber[900],
                  size: 30,
                ),
                label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.contact_page_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                label: "Report"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                label: "Profile"),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const menthome()));
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const mentrepo()));
              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const mentpro()));
            }
          },
          backgroundColor: Colors.grey[850],
        ));
  }
}
