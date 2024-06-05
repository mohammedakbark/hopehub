import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class changes extends StatefulWidget {
  const changes({super.key});

  @override
  State<changes> createState() => _changesState();
}

class _changesState extends State<changes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title: Text("Change Password",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,
             ),
             backgroundColor: Colors.grey[850],
             body:SingleChildScrollView(child:  Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 60,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),
                    hintText: "Current Password",
                    hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:18)
                    ),
                     style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                SizedBox(
                  height: 60,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),
                    hintText: "Change Password",
                    hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:18)
                    ),
                     style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                 SizedBox(height: 30,),

                SizedBox(
                  height: 60,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),
                    hintText: "Confirm Password",
                    hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:18)
                    ),
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor:MaterialStatePropertyAll( Colors.amber[900])),onPressed: (){}, child: Text("Reset",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)))),
                )
              ],),)
    );
  }
}