import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class call extends StatefulWidget {
  const call({super.key});

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("About Call and Video",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,),
             backgroundColor: Colors.grey[850],
             body: Padding(
               padding: const EdgeInsets.only(left: 20,top: 40),
               child: Text("You can call or video call to the doctor after get a appointment.In the scheduled time you can attend the voice and video call ",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             ),
    );
  }
}