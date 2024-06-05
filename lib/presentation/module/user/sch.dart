import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sch extends StatefulWidget {
  const sch({super.key});

  @override
  State<sch> createState() => _schState();
}

class _schState extends State<sch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("Schedule",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,),
             backgroundColor: Colors.grey[850],
             body: Padding(
               padding: const EdgeInsets.only(left: 20,top: 40),
               child: Text("You can schedule doctor by choosing option in the booking. The counselor is scheduled by doctor ",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             ),
    
    );
  }
}