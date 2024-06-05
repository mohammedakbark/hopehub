import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/mentor_model.dart';
import 'package:hopehub/presentation/module/admin/adhome.dart';
import 'package:hopehub/presentation/module/admin/admenu.dart';
import 'package:hopehub/presentation/module/admin/adnotification.dart';
import 'package:hopehub/presentation/module/admin/aduser.dart';
import 'package:hopehub/presentation/module/admin/newment.dart';

class adment extends StatefulWidget {
  String doctroID;
  adment({super.key, required this.doctroID});

  @override
  State<adment> createState() => _admentState();
}

class _admentState extends State<adment> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;
    return Scaffold(
      drawer: const admenu(),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 30,
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const aduser()));
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const adnoti()));
                },
                icon: const Icon(
                  Icons.mark_as_unread_sharp,
                  color: Colors.white,
                  size: 30,
                )),
          ]),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('mentor')
                    .where('doctorId', isEqualTo: widget.doctroID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  //   return const Center(
                  //     child: Text(
                  //       'No data available',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   );
                  // }
                  var mentors = snapshot.data!.docs
                      .map((doc) => MentorModel.fromData(
                          doc.data() as Map<String, dynamic>))
                      .toList();
                  return Expanded(
                      child: mentors.isEmpty
                          ? const Center(
                              child: Text(
                                'No Mentors Available',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : ListView.builder(
                              itemCount: mentors.length,
                              itemBuilder: (context, index) {
                                var mentormodel = mentors[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 240,
                                    width: 280,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: Colors.black),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                mentormodel.name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 47,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  radius: 45,
                                                  backgroundImage: AssetImage(
                                                      "assets/mentor.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      mentormodel.qualification,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      mentormodel.experience,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      mentormodel.language,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      mentormodel.phone,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      mentormodel.email,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      mentormodel.password,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 60, top: 15),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: 100,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
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
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddNewMentorPage(
                                                                    doctroID: widget
                                                                        .doctroID,
                                                                  )));
                                                    },
                                                    child: const Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: SizedBox(
                                                  height: 40,
                                                  width: 100,
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
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ));
                }),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.white))),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amber[900])),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewMentorPage(
                                doctroID: widget.doctroID,
                              )));
                },
                child: const Text(
                  "Add New mentor",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
