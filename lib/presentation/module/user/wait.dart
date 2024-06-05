import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class wait extends StatefulWidget {
  const wait({super.key});

  @override
  State<wait> createState() => _waitState();
}

class _waitState extends State<wait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Padding(
        padding: const EdgeInsets.only(top: 350,left: 150),
        child: Icon(Icons.schedule_outlined,color: Colors.white,size: 100,),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30,left: 140),
        child: Text("waiting...",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:25),),
      )
      ],),),
    );
  }
}