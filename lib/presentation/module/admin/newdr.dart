// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/presentation/module/admin/adhome.dart';
import 'package:hopehub/data/firebase/admin_controller.dart';
import 'package:hopehub/presentation/module/user/page_profilepage.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hopehub/admin/adhome.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class newdr extends StatefulWidget {
  const newdr({super.key});

  @override
  State<newdr> createState() => _newdrState();
}

File? selectedImage;

class _newdrState extends State<newdr> {
  AdminController adddrcontroller = AdminController();

  final _auth = FirebaseAuth.instance;
  final DrnameController = TextEditingController();
  final QualificationController = TextEditingController();
  final ExpertController = TextEditingController();
  final LanguageController = TextEditingController();
  final PhoneController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ImageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await adddrcontroller.pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> drregister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = EmailController.text;
        password = PasswordController.text;
      });
      if (selectedImage != null) {
        try {
          await _auth
              .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
              .then((value) async {
            final uid = value.user!.uid;

            await adddrcontroller
                .uploadImage(selectedImage!)
                .then((imageUrl) async {
              final drmodel = Drmodel(
                  name: DrnameController.text,
                  qualification: QualificationController.text,
                  expert: ExpertController.text,
                  language: LanguageController.text,
                  phone: PhoneController.text,
                  email: EmailController.text,
                  password: PasswordController.text,
                  imageUrl: imageUrl);

              await adddrcontroller.addDr(
                drmodel,
                uid,
              );
            });
            CSnackBar.showSuccesSnack(context, 'Doctor added successfully');

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const adhome()),
            );
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            CSnackBar.showErrorSnack(context, 'Weak password');
          } else if (e.code == 'email-already-in-use') {
            CSnackBar.showErrorSnack(context, 'E-mail is already in use');
          }
        } catch (e) {
          print(e);
        }
      } else {
        CSnackBar.showErrorSnack(context, "Upload Doctor Image!");
      }
    }
  }

  // Future drregister() async {
  //   try {
  //     return await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => value.user!.uid);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('password is weak')));
  //     } else if (e.code == 'email-already-in-use') {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("email is already in use")));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23, top: 100),
                      child: Container(
                        height: 750,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: DrnameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: "Doctor Name",
                                      hintStyle: GoogleFonts.inknutAntiqua(
                                          color: Colors.white, fontSize: 15)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter the doctor name";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: CircleAvatar(
                                            radius: 45,
                                            backgroundImage:
                                                selectedImage != null
                                                    ? FileImage(selectedImage!)
                                                    : const AssetImage(
                                                            "assets/image.png")
                                                        as ImageProvider,
                                            child: IconButton(
                                                onPressed:
                                                    _pickImageFromGallery,
                                                icon: const Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ),

                                        // CircleAvatar(
                                        //   radius: 87,
                                        //   backgroundColor: Colors.white,
                                        //   child: CircleAvatar(
                                        //       radius: 80,
                                        //       backgroundImage: selectedImage != null
                                        //           ? FileImage(selectedImage!)
                                        //           : AssetImage("assets/image.png")
                                        //               as ImageProvider,
                                        //       child: CircleAvatar(
                                        //         radius: 23,
                                        //         backgroundColor: Colors.white,
                                        //         child: IconButton(
                                        //             onPressed: _pickImageFromGallery,
                                        //             icon: Icon(
                                        //               Icons.camera_alt_outlined,
                                        //               color: Colors.black,
                                        //             )),
                                        //       )),
                                        // ),

                                        SizedBox(
                                          width: 220,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      QualificationController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      hintText: "qualification",
                                                      hintStyle: GoogleFonts
                                                          .inknutAntiqua(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontSize: 15)),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please enter the qualification";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 400,
                                                  child: TextFormField(
                                                    controller:
                                                        ExpertController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        hintText: "Expert",
                                                        hintStyle: GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Please enter doctor experts";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                  maxLines: 3,
                                                  controller:
                                                      LanguageController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                      hintText: "Languages",
                                                      hintStyle:
                                                          GoogleFonts.inknutAntiqua(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontSize: 15)),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please enter the languages of doctor";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 400,
                                                  child: TextFormField(
                                                    controller: PhoneController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        hintText:
                                                            "Phone number",
                                                        hintStyle: GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the phone number";
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                  controller: EmailController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                      hintText: "E Mail",
                                                      hintStyle:
                                                          GoogleFonts.inknutAntiqua(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontSize: 15)),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Enter the email";
                                                    }
                                                    RegExp emailRegExp = RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                                    if (!emailRegExp
                                                        .hasMatch(value)) {
                                                      return "Please Enter a valid Email";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 400,
                                                  child: TextFormField(
                                                    controller:
                                                        PasswordController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        hintText: "Password",
                                                        hintStyle: GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the password";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    side: const BorderSide(
                                                        color: Colors.white))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.amber[900])),
                                        onPressed: drregister,
                                        child: Text(
                                          "Submit",
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
