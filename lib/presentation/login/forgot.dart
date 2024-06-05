import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/login/otp.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  final emailController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  String email="";
  


  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email has been sent')),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      }
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
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                    child: Text(
                  "Forget Password",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.amber[900], fontSize: 25),
                )),
              ),
              Center(
                  child: SizedBox(
                      height: 100,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: Text(
                          "we’ll send a verification code to this email or phone number",
                          style: GoogleFonts.inknutAntiqua(
                              color: Colors.white, fontSize: 15),
                        ),
                      ))),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Type Email ",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber[900])),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            resetPassword();
                          });
                          
                        }
          
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => otp()));
                      },
                      child: Text(
                        "Send",
                        style: GoogleFonts.inknutAntiqua(color: Colors.white),
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
