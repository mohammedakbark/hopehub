import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/login_preference.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/doctor/custome_drawer.dart';
import 'package:hopehub/presentation/module/doctor/de_notif_page.dart';
import 'package:hopehub/presentation/module/doctor/drchat.dart';
import 'package:hopehub/presentation/module/user/chatting.dart';

import 'package:hopehub/presentation/module/doctor/drpro.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';
import 'package:hopehub/presentation/login/login1.dart';

import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';
import 'package:hopehub/presentation/widget/room/api_controller.dart';
import 'package:provider/provider.dart';

class drhome extends StatefulWidget {
  const drhome({super.key});

  @override
  State<drhome> createState() => _drhomeState();
}

class _drhomeState extends State<drhome> {
  DbController? dbController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: DrCustomeDrawer(),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DrNotificationPage()));
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
            child:
                Consumer<DbController>(builder: (context, controller, child) {
              return StreamBuilder<QuerySnapshot>(
                  stream: controller.getBooking(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<BookingModel> mybooking = snapshot.data!.docs
                        .map((e) => BookingModel.fromMap(
                            e.data() as Map<String, dynamic>))
                        .toList();
                    if (snapshot.hasData) {
                      return mybooking.isEmpty
                          ? const Center(
                              child: Text("No booking Found"),
                            )
                          : ListView.builder(
                              itemCount: mybooking.length,
                              itemBuilder: (context, index) {
                                return StreamBuilder<DocumentSnapshot>(
                                    stream: DbController()
                                        .getUSerData(mybooking[index].userid),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      UserModel userModel = UserModel.fromMap(
                                          snapshot.data!.data()
                                              as Map<String, dynamic>);
                                      if (snapshot.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                              height: 200,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Image.network(
                                                      userModel.imageUrl!,
                                                      scale: 1.3,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, bottom: 8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 20),
                                                          child: Text(
                                                            userModel.name,
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ),
                                                        Text(
                                                          mybooking[index]
                                                              .email,
                                                          style: GoogleFonts
                                                              .inknutAntiqua(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: SizedBox(
                                                              width: 150,
                                                              child: Text(
                                                                mybooking[index]
                                                                    .whatsApp,
                                                                style: GoogleFonts
                                                                    .inknutAntiqua(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                              )),
                                                        ),
                                                        Row(
                                                          children: [
                                                            // Text(
                                                            //   "Today     |",
                                                            //   style: GoogleFonts
                                                            //       .inknutAntiqua(
                                                            //           color: Colors
                                                            //               .white,
                                                            //           fontSize: 15),
                                                            // ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            20),
                                                                child: Text(
                                                                  // "10:00 PM",
                                                                  DateTime.parse(
                                                                          mybooking[index]
                                                                              .bookingTime)
                                                                      .toString(),
                                                                  style: GoogleFonts.inknutAntiqua(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          mybooking[index]
                                                              .sessionMode,
                                                          style: GoogleFonts
                                                              .inknutAntiqua(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                        ),
                                                        mybooking[index].status ==
                                                                "assigned"
                                                            ? ElevatedButton(
                                                                style: ButtonStyle(
                                                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                7),
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .white))),
                                                                    backgroundColor:
                                                                        MaterialStatePropertyAll(Colors
                                                                            .transparent)),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                    "Assigned",
                                                                    style: GoogleFonts.inknutAntiqua(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 15)))
                                                            : Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            15),
                                                                child: Row(
                                                                  children: [
                                                                    ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            shape:
                                                                                MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7), side: const BorderSide(color: Colors.white))),
                                                                            backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
                                                                        onPressed: () {
                                                                          if (mybooking[index].status ==
                                                                              "Pending") {
                                                                            DbController().updayeStatus(
                                                                                mybooking[index].bookingid,
                                                                                mybooking[index].userid,
                                                                                "Accepted",
                                                                                FirebaseAuth.instance.currentUser!.uid);
                                                                          } else {
                                                                            if (mybooking[index].sessionMode ==
                                                                                "Chat") {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => chatting(
                                                                                        isMentor: false,
                                                                                        doctorId: "",sessionId: "",userId: "",
                                                                                            userCollection: "user",
                                                                                            receiverId: mybooking[index].userid,
                                                                                            bookingId: mybooking[index].bookingid,
                                                                                          )));
                                                                            }
                                                                            if (mybooking[index].sessionMode ==
                                                                                "Video Call") {
                                                                              onCreateButtonPressed(context, mybooking[index].userid, mybooking[index].bookingid, false, "N/A", "N/A");
                                                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRoomScreen()));
                                                                            }
                                                                            if (mybooking[index].sessionMode ==
                                                                                "Call") {
                                                                              onCreateButtonPressed(context, mybooking[index].userid, mybooking[index].bookingid, false, "N/A", "N/A");
                                                                            }
                                                                          }
                                                                        },
                                                                        child: Text(
                                                                          mybooking[index].status == "Pending"
                                                                              ? "Accept"
                                                                              : mybooking[index].sessionMode,
                                                                          style: GoogleFonts.inknutAntiqua(
                                                                              color: Colors.white,
                                                                              fontSize: 15),
                                                                        )),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10),
                                                                      child: mybooking[index].status ==
                                                                              "Pending"
                                                                          ? ElevatedButton(
                                                                              style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7), side: const BorderSide(color: Colors.white))), backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
                                                                              onPressed: () {
                                                                                DbController().updayeStatus(mybooking[index].bookingid, mybooking[index].userid, "Rejected", FirebaseAuth.instance.currentUser!.uid);
                                                                              },
                                                                              child: Text(
                                                                                "Reject",
                                                                                style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
                                                                              ))
                                                                          : SizedBox(),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    });
                              },
                            );
                    } else {
                      return const SizedBox();
                    }
                  });
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
            label: "Report",
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              label: "Profile"),
        ],
        backgroundColor: Colors.grey[850],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const drhome()));
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const drreport()));
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const drprofile()));
          }
        },
      ),
    );
  }
}
