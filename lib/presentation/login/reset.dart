import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/login/loginpage.dart';
import 'package:hopehub/presentation/login/update.dart';

class reset extends StatefulWidget {
  const reset({super.key});

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(child: Column(children: [
        Container(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top:  100),
            child: Text("Reset your Password",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:20),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(height: 50,width: 300,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white)),
              hintText: "New Password",
              hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),
              prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.white.withOpacity(0.5),),
              suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white.withOpacity(0.5),),
              )
              ,),
              
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(height: 50,width: 300,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white)),
              hintText: "Confirm Password",
              hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),
              prefixIcon: Icon(Icons.lock_person_outlined,color: Colors.white.withOpacity(0.5),),
              suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white.withOpacity(0.5),),
              )
              ,),
              
            ),
          ),
          Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SizedBox(height: 40,width: 250,
          child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),side: const BorderSide(color: Colors.white))),
            backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const updated()));
          }, child: Text("Update",style: GoogleFonts.inknutAntiqua(color:Colors.white),)),
        ),
      )

        ],
          


        ),
        )


      ],),),
    );
  }
}