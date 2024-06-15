import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/doctor/drpro.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class DrCustomeDrawer extends StatelessWidget {
  const DrCustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
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
            Drmodel model =
                Drmodel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
            return ListView(children: [
              Padding(
                padding: const EdgeInsets.only(right: 200, top: 20),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(model.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Dr.${model.name}",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => drprofile()));
                  },
                  leading: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  iconColor: Colors.amber[900],
                  title: Text(
                    "Profile",
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  )),
              Divider(),
              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => drhome()));
                  },
                  leading: Icon(
                    Icons.pending_actions_rounded,
                    size: 30,
                  ),
                  iconColor: Colors.amber[900],
                  title: Text(
                    "My Schedule",
                    style: GoogleFonts.inknutAntiqua(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drreport()));
                },
                leading: Icon(
                  Icons.contact_page_outlined,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text("Report",
                    style: GoogleFonts.inknutAntiqua(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => setting()));
                },
                leading: Icon(
                  Icons.settings,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text("Settings",
                    style: GoogleFonts.inknutAntiqua(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => helps()));
                },
                leading: Icon(
                  Icons.help,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text("Help",
                    style: GoogleFonts.inknutAntiqua(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => logo1()));
                },
                leading: Icon(
                  Icons.logout,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text("Logout",
                    style: GoogleFonts.inknutAntiqua(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              Divider(),
            ]);
          }),
    );
  }
}
