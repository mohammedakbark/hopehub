import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/mentor/mentro_drawer.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/mentor/mentrepo.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class mentpro extends StatefulWidget {
  const mentpro({super.key});

  @override
  State<mentpro> createState() => _mentproState();
}

class _mentproState extends State<mentpro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MentorCusDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          // leading: Center(child: Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: Icon(Icons.menu,color: Colors.white,),
          // )),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Profile",
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
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
          ],
        ),
        backgroundColor: Colors.grey[850],
        body: FutureBuilder(
            future: DbController()
                .getSelectedMentor(FirebaseAuth.instance!.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              MentorModel mentor = MentorModel.fromData(
                  snapshot.data!.data() as Map<String, dynamic>);
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/mentbg.jpg",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 300, top: 280),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 110, top: 240),
                        child: CircleAvatar(
                          radius: 87,
                          backgroundImage: NetworkImage(
                            mentor.profile,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 340, left: 250),
                        child: Stack(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                    Icons.camera_alt_sharp,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.blue,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    mentor.name,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      mentor.qualification,
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Text(
                    "${mentor.experience} years Experience",
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    mentor.language,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    mentor.email,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        side: const BorderSide(
                                            color: Colors.white))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.amber[900])),
                            onPressed: () {},
                            child: Text(
                              "share",
                              style: GoogleFonts.inknutAntiqua(
                                  color: Colors.white),
                            ))),
                  )
                ],
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          selectedItemColor: Colors.amber[900],
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
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
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber[900],
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
