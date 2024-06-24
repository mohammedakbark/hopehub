import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:hopehub/data/Model/prescription.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/doctor/custome_drawer.dart';
import 'package:hopehub/presentation/module/doctor/de_notif_page.dart';

import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/doctor/drpro.dart';
import 'package:hopehub/presentation/module/mentor/drsent.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/doctor/mentsent.dart';
import 'package:hopehub/presentation/module/user/newrep.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class drreport extends StatefulWidget {
  const drreport({super.key});

  @override
  State<drreport> createState() => _drreportState();
}

class _drreportState extends State<drreport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Report",
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
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<QuerySnapshot>(
          stream: DbController().getMyPrescription(
              "drID", FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<PrescriptionModel> listOfSessions = snapshot.data!.docs
                .map((e) => PrescriptionModel.fromJosn(
                    e.data() as Map<String, dynamic>))
                .toList();
            if (snapshot.hasData) {
              return listOfSessions.isEmpty
                  ? Center(
                      child: Text("No Prescriptions"),
                    )
                  : ListView.builder(
                      itemCount: listOfSessions.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(20),
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
                              Image.network(listOfSessions[index].prescription),
                              FutureBuilder<DocumentSnapshot>(
                                  future: DbController().getSelectedMentor(
                                      listOfSessions[index].metID),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    MentorModel mentor = MentorModel.fromData(
                                        snapshot.data!.data()
                                            as Map<String, dynamic>);
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Assigned :${mentor.name}",
                                            style: GoogleFonts.inknutAntiqua(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),

                                        ElevatedButton(
                                            onPressed: () async {
                                              await launch(listOfSessions[index]
                                                  .prescription);
                                            },
                                            child: Text("Open"))
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 10, top: 15),
                                        //   child: Text(
                                        //     "Status :${listOfSessions[index].status}",
                                        //     style: GoogleFonts.inknutAntiqua(
                                        //         color: Colors.white,
                                        //         fontSize: 15),
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 20, left: 80),
                                        //   child: Row(
                                        //     children: [
                                        //       IconButton(
                                        //         onPressed: () {},
                                        //         icon: const Icon(
                                        //           Icons.download_for_offline,
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
                                        //       //                 const mentsent()));
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
                      ),
                    );
            } else {
              return const SizedBox();
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: Colors.amber[900],
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_page_outlined,
                color: Colors.amber[900],
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
                  MaterialPageRoute(builder: (context) => const drhome()));
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const drreport()));
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const drprofile()));
          }
        },
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}
