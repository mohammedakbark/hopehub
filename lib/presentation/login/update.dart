import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/login/loginpage.dart';
import 'package:hopehub/presentation/login/loginpage.dart';

class updated extends StatefulWidget {
  const updated({super.key});

  @override
  State<updated> createState() => _updatedState();
}

class _updatedState extends State<updated> {
  @override
  Widget build(BuildContext context) {
    var padding = Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
              height: 400,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password Changed",
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.amber[900],
                          fontSize: 20,
                          shadows: [Shadow(color: Colors.black)]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "You’re successfully changed password",
                        style: GoogleFonts.inknutAntiqua(
                            color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Icon(
                        Icons.verified,
                        color: Colors.amber[900],
                        size: 70,
                      ),
                    ),

                    // Image(image: AssetImage("assets\verification.svg")),
                    // Image.asset("assets/verification.svg"),
                    // Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/verification.svg"))),),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(color: Colors.white))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber[900])),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Login",
                            style:
                                GoogleFonts.inknutAntiqua(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: padding,
    );
  }
}
