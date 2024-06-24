import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/prescription.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/user/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menuss(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(25), child: Divider()),
          toolbarHeight: 45,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 25,
                ));
          }),
        ),
        backgroundColor: Colors.grey[850],
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getMyPrescription(
                "uid", FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<PrescriptionModel> sessions = snapshot.data!.docs
                  .map((e) => PrescriptionModel.fromJosn(
                      e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return sessions.isEmpty
                    ? Center(
                        child: Text("No Prescription"),
                      )
                    : ListView.builder(
                        itemCount: sessions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.black,
                            ),
                            height: 200,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 30, bottom: 20),
                              child: Row(
                                children: [
                                  Image.network(sessions[index].prescription),
                                  FutureBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                      future: DbController()
                                          .fetchSingleUserData(
                                              sessions[index].uid),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const SizedBox();
                                        }
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "${snapshot.data!.data()!["name"]}",
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                              ),
                                            ),

                                            ElevatedButton(
                                                onPressed: () async {
                                                  await launch(sessions[index]
                                                      .prescription);
                                                },
                                                child: Text("Open"))
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 78, left: 80),
                                            //   child: Row(
                                            //     children: [
                                            //       IconButton(
                                            //         onPressed: () {},
                                            //         icon: const Icon(
                                            //           Icons
                                            //               .download_for_offline,
                                            //           size: 25,
                                            //           color: Colors.white,
                                            //         ),
                                            //       ),
                                            //       // IconButton(
                                            //       //   onPressed: () {
                                            //       //     Navigator.push(
                                            //       //         context,
                                            //       //         MaterialPageRoute(
                                            //       //             builder: (context) =>
                                            //       //                 const drsent()));
                                            //       //   },
                                            //       //   icon: const Icon(
                                            //       //     Icons.send_sharp,
                                            //       //     size: 25,
                                            //       //     color: Colors.white,
                                            //       //   ),
                                            //       // )
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        );
                                      })
                                ],
                              ),
                            ),
                          );
                        },
                      );
              } else {
                return const SizedBox();
              }
            }));
  }
}
