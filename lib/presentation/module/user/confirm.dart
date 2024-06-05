import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class confirm extends StatefulWidget {
  const confirm({super.key});

  @override
  State<confirm> createState() => _confirmState();
}

class _confirmState extends State<confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      toolbarHeight: 50,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel,color: Colors.white,size: 30,)),
      title: Text("Confirm Payment",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
      ),
      backgroundColor: Colors.grey[850],
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top: 60,left: 30),
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black,),
            height: 300,
            width: 300,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black,),
                  height: 40,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("To:  Dr Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20)),
                  ),
                   
                  ],)
                
                ),
              ),
              Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Text("Total",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20)),
                           Padding(
                             padding: const EdgeInsets.only(left: 50),
                             child: Text("500",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20)),
                           ),
                      
                      
                      
                        ],
                      ),
                    ),
                  ),
              ],
              ),
          ),
        )
      ],),


    );
  }
}