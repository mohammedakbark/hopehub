import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/helper.dart';
import 'package:hopehub/data/Model/session_model.dart';
import 'package:hopehub/data/firebase/controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/admin/adment.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  String patientId;
  String bookId;
  ReportPage({super.key, required this.patientId, required this.bookId});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Map<String, dynamic>? selectedMentorData;
  int? selectedSession;
  XFile? selectedImage;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Future<void> _pickedImageGallery() async {
    //   final pickedImage =
    //       await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (pickedImage == null) return;
    //   setState(() {
    //     selectedImage = File(pickedImage.path);
    //   });
    // }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
                size: 30,
              )),
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 35, top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 500,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: selectedImage != null
                                ? FileImage(File(selectedImage!.path))
                                :
                                // NetworkImage('')
                                const AssetImage('assets/image.png')
                                    as ImageProvider<Object>),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 430, left: 240),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.5)),
                                color: Colors.amber[900],
                              ),
                              child: IconButton(
                                  onPressed: () async {
                                    Controller()
                                        .pickImageFromCamera()
                                        .then((value) {
                                      selectedImage = value;
                                      setState(() {});
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 15,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: DbController().getCurrentDoctorMentors(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center();
                        }
                        return DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return "Select a option";
                              } else {
                                return null;
                              }
                            },
                            style:
                                GoogleFonts.inknutAntiqua(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              filled: true,
                              labelStyle: const TextStyle(color: Colors.white),
                              hintText: "     Mentors",
                              hintStyle: GoogleFonts.inknutAntiqua(
                                  color: Colors.black),
                            ),
                            items: snapshot.data!.docs
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.data()["name"].toString(),
                                      // style: TextStyle(color: Colors.black),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              selectedMentorData =
                                  value!.data() as Map<String, dynamic>;

                              // log(selectedMentorData.toString());
                            });
                      })
                  // TextFormField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(7),
                  //           borderSide: BorderSide(color: Colors.white)),
                  //       hintText: "     Mentors",
                  //       hintStyle: GoogleFonts.inknutAntiqua(color: Colors.white),
                  //       suffixIcon: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(Icons.arrow_drop_down,
                  //               color: Colors.white, size: 30))),
                  // ),
                  ,
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Select a option";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "     Session Number",
                        hintStyle:
                            GoogleFonts.inknutAntiqua(color: Colors.black),
                      ),
                      items: List.from([1, 2, 3, 4, 5])
                          .map((e) => DropdownMenuItem<int>(
                              value: e, child: Text(e.toString())))
                          .toList(),
                      onChanged: (value) {
                        selectedSession = value;
                        print(selectedSession);
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber[900])),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (selectedImage != null) {
                                Controller()
                                    .uploadImage("prescription",
                                        File(selectedImage!.path))
                                    .then((url) {
                                  DbController().assignAPatientToMentor(
                                      SessionModel(
                                          bookingId: widget.bookId,
                                          doctorId: FirebaseAuth
                                              .instance.currentUser!.uid,
                                          mentroId: selectedMentorData!["id"],
                                          paymentStatus: false,
                                          presctiption: url,
                                          status: "assigned",
                                          totalSession: selectedSession!,
                                          uid: widget.patientId));
                                }).then((value) {
                                  DbController().updayeStatus(
                                      widget.bookId,
                                      widget.patientId,
                                      "assigned",
                                      FirebaseAuth.instance.currentUser!.uid);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const drreport()));
                                });
                              } else {
                                CSnackBar.showErrorSnack(
                                    context, "Pick Image!");
                              }
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const drreport()));
                          },
                          child: Text(
                            "Done",
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.white, fontSize: 15),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}
