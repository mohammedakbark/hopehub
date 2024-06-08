// import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/login_preference.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/login/loginpage.dart';
import 'package:hopehub/presentation/module/user/connection.dart';
import 'package:hopehub/presentation/module/user/help.dart';


import 'package:hopehub/presentation/module/user/page_profilepage.dart';
import 'package:hopehub/presentation/module/user/feedback.dart';
import 'package:hopehub/presentation/module/user/page_schedule.dart';
import 'package:hopehub/presentation/module/user/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class menuss extends StatefulWidget {
  const menuss({super.key});

  @override
  State<menuss> createState() => _menussState();
}

class _menussState extends State<menuss> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;
    return Drawer(
        backgroundColor: Colors.black,
        child:

            //     StreamBuilder(stream: _firestore.collection('user').doc(id).snapshots(),
            //      builder: (context,snapshot){
            //      UserModel userModel=UserModel.fromMap(snapshot.data!.data()!);
            //      String image=userModel.imageUrl.toString();

            //  if(snapshot.connectionState == ConnectionState.waiting){
            //   return Center(child: CircularProgressIndicator(),);

            //  }

            //       DocumentSnapshot data= snapshot.data!;
            //         return
            ListView(
          children: [
            // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),

            Padding(
              padding: const EdgeInsets.only(right: 200, top: 20),
              child: StreamBuilder(
                  stream: _firestore.collection('user').doc(id).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SizedBox(),
                      );
                    }
                    UserModel userModel =
                        UserModel.fromMap(snapshot.data!.data()!);
                    String image = userModel.imageUrl.toString();

                    // DocumentSnapshot image=snapshot.data!;
                    return Column(
                      children: [
                        image == ""
                            ? CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage("assets/image.png"))
                            : CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(image)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          userModel.name,
                          style: GoogleFonts.inknutAntiqua(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    );
                  }),
            ),
            // StreamBuilder(
            //   stream: FirebaseFirestore.instance
            //       .collection('user')
            //       .doc(id)
            //       .snapshots(),
            //   builder: (context, snapshot) {
            //     UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);
            //     //String image=userModel.imageUrl.toString();
            //     return Padding(
            //       padding: const EdgeInsets.only(top: 10, left: 10),
            //       child: Text(
            //         userModel.name,
            //         style: GoogleFonts.inknutAntiqua(
            //             color: Colors.white, fontSize: 18),
            //       ),
            //     );
            //   },
            // ),

            const SizedBox(
              height: 30,
            ),

            ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
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
                      MaterialPageRoute(builder: (context) => const schedle()));
                },
                leading: const Icon(
                  Icons.system_security_update_good_rounded,
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const pay()));
              },
              leading: const Icon(
                Icons.contact_page_outlined,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Prescription",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const feedback()));
              },
              leading: const Icon(
                Icons.person_add_alt_1,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("feedback",
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
                // SharedPreferences preferences =
                //     await SharedPreferences.getInstance();
                _auth.signOut().then((value) => Navigator.of(context)
                    .pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const logo1()),
                        (route) => false));
                LoginPreference.clearPreference();
                // preferences.clear();
                // log('Logout sucessfully' as num);
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
        )
        //  }
        //  )

        );
  }
}
