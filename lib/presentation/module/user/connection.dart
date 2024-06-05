import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';

class connection extends StatefulWidget {
  const connection({super.key});

  @override
  State<connection> createState() => _connectionState();
}

class _connectionState extends State<connection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)),
      title: Text("Connections",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),),
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      toolbarHeight: 50,
      ),
      backgroundColor: Colors.grey[850],
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top: 40,left: 20),
          child: Row(
            children: [
              Icon(Icons.stars_rounded,color: Colors.amber[900                                                                                        ],size: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(height: 200,width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black),
                child: Column(children: [Text("Looking for someone to talk to?",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)
                ,Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text("Talk to HopeHub Experts for ultimate support and guidence.",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));}, child: Text("Start chat",style:  GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15))),
                )
                ],),
                
                
                ),
              ),
            ],
          ),
        )
      ],),


    );
  }
}