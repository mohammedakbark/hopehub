import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/controller.dart';

import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/data/firebase/authenticatio.dart';
import 'package:hopehub/presentation/login/loginpage.dart';
import 'package:hopehub/presentation/module/doctor/packagedr.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_instate();
}

File? selectedImage;

class _sign_instate extends State<sign_in> {
  // create controller object

  final UserNameController = TextEditingController();
  final EmailController = TextEditingController();
  final NewPassController = TextEditingController();
  final ConfirmPassController = TextEditingController();
  final AddressController = TextEditingController();
  final PhoneController = TextEditingController();
  final imagecontroller = TextEditingController();
  String? imageUrl;
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await Controller().pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Signup",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.amber[900], fontSize: 30),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: selectedImage != null
                      ? FileImage(selectedImage!)
                      : const AssetImage("assets/image.png") as ImageProvider,
                  child: IconButton(
                      onPressed: _pickImageFromGallery,
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: UserNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Name";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Address";
                    }

                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: AddressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Address",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5)),
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Number";
                    }

                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: PhoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5)),
                      prefixIcon: const Icon(
                        Icons.phone_sharp,
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: EmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      )),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Email";
                    }
                    RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegExp.hasMatch(value)) {
                      return "Please Enter a valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: NewPassController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.white,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      )),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Password";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: ConfirmPassController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Confirm Password",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: const Icon(
                        Icons.lock_reset,
                        color: Colors.white,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      )),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Confirm Password";
                    }

                    if ((NewPassController.text !=
                        ConfirmPassController.text)) {
                      return "Password do not match with confirm password";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber[900])),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedImage != null) {
                            Controller()
                                .uploadImage("userprofile",selectedImage!)
                                .then((value) {
                              imageUrl = value;
                            });
                          }
                          AuthenctionUser()
                              .registerAUser(
                                  context,
                                  EmailController.text,
                                  ConfirmPassController.text,
                                  UserModel(
                                      name: UserNameController.text,
                                      email: EmailController.text,
                                      phone: PhoneController.text,
                                      address: AddressController.text,
                                      imageUrl: imageUrl ?? ""))
                              .then((value) {
                            CSnackBar.showSuccesSnack(context,
                                "Registration Succesfull!,Please Login");
                            Navigator.of(context).pushAndRemoveUntil(
                                (MaterialPageRoute(
                                    builder: (context) => const LoginPage())),
                                (route) => false);
                          });
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.inknutAntiqua(
                            color: Colors.white, fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
