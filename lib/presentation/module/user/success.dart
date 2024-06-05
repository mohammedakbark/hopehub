import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.only(left: 60, top: 150),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.black,
          ),
          height: 500,
          width: 260,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.verified_rounded,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 10),
                child: Text(
                  "       Your booking is successfully completed",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => packages(indexnum: 0)),
                          (route) => false);
                    },
                    child: Text(
                      "Done",
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.white, fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
