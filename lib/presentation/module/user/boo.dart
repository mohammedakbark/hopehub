import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class boo extends StatefulWidget {
  const boo({super.key});

  @override
  State<boo> createState() => _booState();
}

class _booState extends State<boo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("Booking",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,),
             backgroundColor: Colors.grey[850],
             body: Padding(
               padding: const EdgeInsets.only(left: 20,top: 40),
               child: Text("You can book the doctor by choosing the doctor in the home page. Then you can enter the details and choose the possible schedule and session mode.",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             ),
    
    );
  }
}