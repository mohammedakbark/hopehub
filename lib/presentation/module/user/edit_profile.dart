import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel,color: Colors.white,size: 30,)),),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [Image.asset("assets/Rectangle 24.jpg"),Padding(
              padding: const EdgeInsets.only(left: 320,top: 290),
              child: CircleAvatar(radius: 25,backgroundColor: Colors.white,child: CircleAvatar(radius: 20,child:Icon(Icons.camera_alt_sharp,color: Colors.white,size: 30,),backgroundColor: Colors.blue,),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110,top: 240 ),
              child: CircleAvatar(
                radius: 87,
                backgroundImage: AssetImage("assets/user.jpg",), 
                
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 340,left: 250),
              child: Stack(children: [CircleAvatar(radius: 25,backgroundColor: Colors.white, child: CircleAvatar(radius: 20,child:Icon(Icons.camera_alt_sharp,color: Colors.white,size: 30,) , backgroundColor: Colors.blue,) )],),
            )
             
                
              
            ],
          ),

          SizedBox(
            height: 70,width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)
              ),
              labelText: "Name",labelStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ),),
            ),
          ),

           SizedBox(
            height: 70,width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)
              ),
              labelText: "Address",labelStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ),),
            ),
          ),
           SizedBox(
            height: 70,width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)
              ),
              labelText: "E Mail",labelStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ),),
            ),
          ),
          SizedBox(
            height: 70,width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)
              ),
              labelText: "Whatsapp Number",labelStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){}, child: Text("Submit",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
          )
          

          


        ],),

      ),


    );
  }
}