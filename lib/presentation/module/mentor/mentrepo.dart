import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/mentor/drsent.dart';
import 'package:hopehub/presentation/module/mentor/mentro_drawer.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/mentor/mentpro.dart';
import 'package:hopehub/presentation/module/user/newrep.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class mentrepo extends StatefulWidget {
  const mentrepo({super.key});

  @override
  State<mentrepo> createState() => _mentrepoState();
}

class _mentrepoState extends State<mentrepo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Report",
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
        backgroundColor: Colors.grey[850],
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getPrescriptionFormntor(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<SessionModel> sessions = snapshot.data!.docs
                  .map((e) =>
                      SessionModel.fromjson(e.data() as Map<String, dynamic>))
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
                                  Image.network(sessions[index].presctiption),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 78, left: 80),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons
                                                          .download_for_offline,
                                                      size: 25,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  // IconButton(
                                                  //   onPressed: () {
                                                  //     Navigator.push(
                                                  //         context,
                                                  //         MaterialPageRoute(
                                                  //             builder: (context) =>
                                                  //                 const drsent()));
                                                  //   },
                                                  //   icon: const Icon(
                                                  //     Icons.send_sharp,
                                                  //     size: 25,
                                                  //     color: Colors.white,
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            )
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
