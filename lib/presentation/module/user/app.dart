import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appinfo extends StatefulWidget {
  const appinfo({super.key});

  @override
  State<appinfo> createState() => _appinfoState();
}

class _appinfoState extends State<appinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 25,
            )),
        title: Text(
          "App Info",
          style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
        ),
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 150),
        child: Column(
          children: [
            Text(
              "HopeHub",
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Version 1.0",
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 190,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(width: 1, color: Colors.white),
                color: Colors.white,
                image: DecorationImage(image: AssetImage("assets/logo.png", ))
              ),
              height: 80,
              width: 100,
             
              //  Image(image: AssetImage("assets/logo.png",

              //  ),

              //  ),
            ),
            Text(
              "HopeHub",
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
