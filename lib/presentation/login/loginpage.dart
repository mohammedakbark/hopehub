// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:hopehub/forgot.dart';
// import 'package:hopehub/login/forgot.dart';
// import 'package:hopehub/user/myproject.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/business_logic/helper.dart';
import 'package:hopehub/business_logic/login_preference.dart';
import 'package:hopehub/presentation/module/admin/adhome.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/login/forgot.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future login(email, password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((credential) {
        LoginPreference.setPreference(credential.user!.uid);
        CSnackBar.showSuccesSnack(context, 'Login succesfull');
        if (credential.user!.uid == Helper.ADMINUID) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => adhome()),
              (route) => false);
        } else {
          LoginPreference().checkTheUser(credential.user!.uid, context);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return CSnackBar.showErrorSnack(context, 'The user is not found');
      } else if (e.code == 'wrong-password') {
        return CSnackBar.showErrorSnack(context, "Wrong password");
      } else {
        return CSnackBar.showErrorSnack(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      // fillColor: Colors.white,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),

                      hintText: "E Mail",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5), fontSize: 15),

                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5))),
                          hintText: "Password",
                          hintStyle: GoogleFonts.inknutAntiqua(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white.withOpacity(0.5),
                            size: 20,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter the Password";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 10, left: 200),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const forgot()));
                    },
                    child: Text("Forget Password?",
                        style: GoogleFonts.inknutAntiqua(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber[900])),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(emailController.text, passwordController.text);
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ))
        // Container(height: double.infinity,width: double.infinity,decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Color.fromARGB(97, 22, 22, 22),Color.fromARGB(46, 27, 27, 26)])),)

        );
  }
}
