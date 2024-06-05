import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/login/reset.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(child: Column(children: [Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text("Enter your OTP",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:20),),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Icon(Icons.lock_clock_outlined,color:Colors.amber[900],size: 50,),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 70),
              child: SizedBox(height: 50,width: 50,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,                           
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white))
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47,left: 20),
              child: SizedBox(
                height: 50,width: 50,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                  ],
                  
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white))),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47,left: 20),
              child: SizedBox(
                height: 50,width: 50,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white))),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47,left: 20),
              child: SizedBox(
                height: 50,width: 50,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white))),)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80,right: 100,top: 60),
          child: Text("Resend OTP in:",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SizedBox(height: 40,width: 250,
            child: ElevatedButton( style: ButtonStyle(shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side:BorderSide(color:Colors.white ))),
              backgroundColor:MaterialStatePropertyAll( Colors.amber[900])),onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>reset()));
            }, child: Text("Verify",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
          ),
        )
        ],
          

        ),
        )],),),
    );
  }
}