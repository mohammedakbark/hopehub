import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("About Chats",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,),
             backgroundColor: Colors.grey[850],
             body: Padding(
               padding: const EdgeInsets.only(left: 20,top: 40),
               child: Text("You can send messages to the doctor after get a appointment .In chatting you can send photos and videos by using the camera icon.",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             ),
    );
  }
}