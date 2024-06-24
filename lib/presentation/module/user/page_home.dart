import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/presentation/module/user/booking_doctor_details.dart';
import 'package:hopehub/presentation/module/user/connection.dart';
import 'package:hopehub/presentation/module/user/menu.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/widget/rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  //int selectColor = 0;
  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: const menuss(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading:
            // // Center(
            Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ));
        }),
        //   Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        title: Text(
          "Home",
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
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
              "Popular Experts",
              style: GoogleFonts.inknutAntiqua(
                color: Colors.amber[900],
                fontSize: 25,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('doctor').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                var doctors = snapshot.data!.docs
                    .map((doc) =>
                        Drmodel.fromMap(doc.data() as Map<String, dynamic>))
                    .toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      var drmodel = doctors[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookingDoctorDetailsPage(
                                          doctor: drmodel,
                                        )));
                          },
                          child: Container(
                            // height: 150,
                            width: 350,

                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(7)),

                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          NetworkImage(drmodel.imageUrl),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: CustomRating(
                                          initalRating:
                                              drmodel.rating.toDouble(),
                                          isConst: true,
                                        ))
                                  ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          drmodel.name,
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          drmodel.qualification,
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("assets/Warranty.png"),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: SizedBox(
                                                width: 150,
                                                child: Text(
                                                  drmodel.expert,
                                                  style:
                                                      GoogleFonts.inknutAntiqua(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.language,
                                            color: Colors.blue[900],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(
                                                drmodel.language,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
