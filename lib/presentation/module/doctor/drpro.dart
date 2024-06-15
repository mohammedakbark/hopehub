import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/doctor/custome_drawer.dart';
import 'package:hopehub/presentation/module/doctor/de_notif_page.dart';

import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class drprofile extends StatefulWidget {
  const drprofile({super.key});

  @override
  State<drprofile> createState() => _drprofileState();
}

class _drprofileState extends State<drprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrCustomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        // leading: Center(child: Padding(
        //   padding: const EdgeInsets.only(top: 20),
        //   child: Icon(Icons.menu,color: Colors.white,),
        // )),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Profile",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DrNotificationPage()));
            },
            icon: Icon(
              Icons.notifications_on,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
        ],
      ),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: DbController()
                .getSelectedDoctor(FirebaseAuth.instance.currentUser!.uid),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              Drmodel model = Drmodel.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/drbg.jpg"),
                      Padding(
                        padding: const EdgeInsets.only(left: 110, top: 180),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 83,
                            backgroundImage: NetworkImage(
                              model.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 300, left: 240),
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
                                    size: 30,
                                  ),
                                  backgroundColor: Colors.blue,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Dr.${model.name}",
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      model.expert,
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Text(
                    model.qualification,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    model.language,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    model.phone,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    model.email,
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
                                        side: BorderSide(color: Colors.white))),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.amber[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
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
        backgroundColor: Colors.grey[850],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => drhome()));
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => drreport()));
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => drprofile()));
          }
        },
      ),
    );
  }
}
