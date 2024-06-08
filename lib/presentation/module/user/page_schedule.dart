//       bottomNavigationBar: packages(indexnum: 1),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   showUnselectedLabels: true,

//       //   type: BottomNavigationBarType.fixed,
//       //   currentIndex: 1,
//       //   selectedItemColor: Colors.amber[900],

//       //   items: [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.home,
//       //         color: Colors.white,
//       //         size: 30,
//       //       ),
//       //       label: "Home",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.pending_actions_rounded,
//       //         color: Colors.amber[900],
//       //         size: 30,
//       //       ),
//       //       label: "Schedule",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.payment_rounded,
//       //         color: Colors.white,
//       //         size: 30,
//       //       ),
//       //       label: "Payment",
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.person_2_sharp,
//       //         color: Colors.white,
//       //         size: 30,
//       //       ),
//       //       label: "Profile",
//       //     )
//       //   ],
//       //   onTap: (index) {

//       //     switch (index) {
//       //       case 0:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(
//       //               builder: (context) =>
//       //                   project()), // Replace with your ChatPage widget
//       //         );
//       //         break;
//       //       case 1:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(
//       //               builder: (context) =>
//       //                   schedle()), // Replace with your ChannelsPage widget
//       //         );
//       //         break;
//       //       case 2:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(
//       //               builder: (context) =>
//       //                   pay()), // Replace with your WorknowPage widget
//       //         );
//       //         break;
//       //       case 3:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(
//       //               builder: (context) =>
//       //                   profile()), // Replace with your ServicesPage widget
//       //         );
//       //         break;
//       //     }
//       //   },
//       //   backgroundColor: Colors.transparent,

//       // ),

//     );
//   }
// }

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/user/booking_doctor_details.dart';
import 'package:hopehub/presentation/module/user/chatting.dart';
import 'package:hopehub/presentation/module/user/connection.dart';
import 'package:hopehub/presentation/module/user/menu.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/module/user/page_slote_package.dart';
import 'package:intl/intl.dart';

class schedle extends StatefulWidget {
  const schedle({super.key});

  @override
  State<schedle> createState() => _sheduleState();
}

class _sheduleState extends State<schedle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: const menuss(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  );
                }))),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Schedule",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const notifictn()));
            },
            icon: const Icon(
              Icons.notifications_on,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const connection()));
            },
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Text(
              "Your available Schedule",
              style: GoogleFonts.inknutAntiqua(
                  color: Colors.amber[900], fontSize: 20),
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: DbController().getbookedSchedulesforUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<BookingModel> mybookings = snapshot.data!.docs
                        .map((e) => BookingModel.fromMap(
                            e.data() as Map<String, dynamic>))
                        .toList();

                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: mybookings.length,
                        itemBuilder: (context, index) {
                          return StreamBuilder<DocumentSnapshot>(
                              stream: DbController()
                                  .getDoctorData(mybookings[index].doctorid),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                Drmodel drmodel = Drmodel.fromMap(snapshot.data!
                                    .data()! as Map<String, dynamic>);

                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 30),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (mybookings[index].sessionMode ==
                                            "Chat") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const chatting()));
                                        } else if (mybookings[index]
                                                .sessionMode ==
                                            "Call") {
                                          print("call");
                                        } else {
                                          print("Video Call");
                                        }
                                      },
                                      child: Container(
                                          width: 350,
                                          height: 200,
                                          // color: Colors.black,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10, top: 10),
                                                      child: CircleAvatar(
                                                        radius: 65,
                                                        backgroundImage:
                                                            NetworkImage(drmodel
                                                                .imageUrl),
                                                      )
                                                      //Image.asset("assets/Doctor.jpg"),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 60,
                                                                  top: 10),
                                                          child: Text(
                                                            "Dr.${drmodel.name}",
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 36),
                                                          child: Text(
                                                              drmodel
                                                                  .qualification,
                                                              style: GoogleFonts
                                                                  .inknutAntiqua(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 42),
                                                          child: Text(
                                                              mybookings[index]
                                                                  .sessionMode,
                                                              style: GoogleFonts
                                                                  .inknutAntiqua(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15)),
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     Text("Today:",
                                                        //         style: GoogleFonts
                                                        //             .inknutAntiqua(
                                                        //                 color: Colors
                                                        //                     .white,
                                                        //                 fontSize:
                                                        //                     15)),
                                                        //     Padding(
                                                        //       padding:
                                                        //           const EdgeInsets
                                                        //               .only(
                                                        //               left: 10),
                                                        //       child: Text(
                                                        //           "10.00 AM",
                                                        //           style: GoogleFonts
                                                        //               .inknutAntiqua(
                                                        //                   color: Colors
                                                        //                       .white,
                                                        //                   fontSize:
                                                        //                       15)),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        Text(
                                                            mybookings[index]
                                                                .bookingTime,
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 60, top: 10),
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: 120,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  side: const BorderSide(
                                                                      color: Colors
                                                                          .white))),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Colors.amber[
                                                                          900])),
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  AlertDialog
                                                                      .adaptive(
                                                                backgroundColor:
                                                                    Colors.amber[
                                                                        900],
                                                                title: Text(
                                                                  "Are you sure about canceling this schedule now!",
                                                                  style: GoogleFonts.inknutAntiqua(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(7),
                                                                              side: const BorderSide(color: Colors.white))),
                                                                          backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
                                                                      onPressed: () {
                                                                        DbController().cancelMyBooking(
                                                                            mybookings[index].bookingid,
                                                                            mybookings[index].doctorid);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                        "Yes",
                                                                        style: GoogleFonts.inknutAntiqua(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 10),
                                                                      )),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            "Cancel",
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10),
                                                          )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 10),
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: 120,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  side: const BorderSide(
                                                                      color: Colors
                                                                          .white))),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Colors.amber[
                                                                          900])),
                                                          onPressed: () {
                                                            final now =
                                                                DateTime.now();
                                                            final bookingdate =
                                                                DateTime.parse(
                                                                    mybookings[
                                                                            index]
                                                                        .bookingTime);
                                                            final format =
                                                                DateFormat(
                                                                    "yyyy-MM-dd");
                                                            final formatedNow =
                                                                format.format(
                                                                    now);
                                                            final formatedbookingDate =
                                                                format.format(
                                                                    bookingdate);

                                                            print(formatedNow);
                                                            print(
                                                                formatedbookingDate);
                                                            if (formatedNow ==
                                                                formatedbookingDate) {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    AlertDialog
                                                                        .adaptive(
                                                                  backgroundColor:
                                                                      Colors.amber[
                                                                          900],
                                                                  title: Text(
                                                                    "You can't reshedule at the momemt.Your schedule already proceed",
                                                                    style: GoogleFonts.inknutAntiqua(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  actions: [
                                                                    ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            shape:
                                                                                MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7), side: const BorderSide(color: Colors.white))),
                                                                            backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
                                                                        onPressed: () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: Text(
                                                                          "Cancel",
                                                                          style: GoogleFonts.inknutAntiqua(
                                                                              color: Colors.white,
                                                                              fontSize: 10),
                                                                        )),
                                                                  ],
                                                                ),
                                                              );
                                                            } else {
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          SlotePackagePage(
                                                                            bookingIdForReshedule:
                                                                                mybookings[index].bookingid,
                                                                            isRescheduling:
                                                                                true,
                                                                            isFreeBook:
                                                                                true,
                                                                            drName:
                                                                                drmodel.name,
                                                                            drid:
                                                                                mybookings[index].doctorid,
                                                                            email:
                                                                                mybookings[index].email,
                                                                            name:
                                                                                mybookings[index].patientName,
                                                                            whatsappnumber:
                                                                                mybookings[index].whatsApp,
                                                                          )));
                                                            }
                                                          },
                                                          child: Text(
                                                            "Reschedule",
                                                            style: GoogleFonts
                                                                .inknutAntiqua(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
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
                  }))
        ],
      ),
    );
  }
}
