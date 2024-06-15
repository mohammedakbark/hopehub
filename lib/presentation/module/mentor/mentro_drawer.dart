import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/login_preference.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/mentor/mentpro.dart';
import 'package:hopehub/presentation/module/mentor/mentrepo.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class MentorCusDrawer extends StatelessWidget {
  const MentorCusDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: FutureBuilder(
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
          return ListView(
            children: [
              // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),
          
               Padding(
                padding: EdgeInsets.only(right: 200, top: 20),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(mentor.profile),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  mentor.name,
                  style:
                      GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
                ),
              ),
          
              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const mentpro()));
                  },
                  leading: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  iconColor: Colors.amber[900],
                  title: Text(
                    "Profile",
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 15),
                  )),
              const Divider(),
              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const menthome()));
                  },
                  leading: const Icon(
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
          
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const mentrepo()));
                },
                leading: const Icon(
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
          
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const setting()));
                },
                leading: const Icon(
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
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const helps()));
                },
                leading: const Icon(
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
              const Divider(),
              ListTile(
                onTap: () async {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const logo1()),
                          (route) => false));
                  LoginPreference.clearPreference();
                },
                leading: const Icon(
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
              const Divider(),
            ],
          );
        }
      ),
    );
  }
}
