import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class newrepo extends StatefulWidget {
  const newrepo({super.key});

  @override
  State<newrepo> createState() => _newrepoState();
}

class _newrepoState extends State<newrepo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.cancel,color: Colors.white,size: 30,)),
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(top: 80,left: 35),
          child: Column(
            children: [
              Container(height: 500,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white), color: Colors.white,),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 280,
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),
                hintText: "Name",
                hintStyle:GoogleFonts.inknutAntiqua(color:Colors.black.withOpacity(0.5),fontSize:15) 
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 120,
                      child: TextField(
                      
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Colors.black)
                              ),
                          hintText: "Age",
                          hintStyle:GoogleFonts.inknutAntiqua(color:Colors.black.withOpacity(0.5),
                          fontSize:15),)),
                    ),
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                        
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.black)
                                ),
                            hintText: "Date",
                            hintStyle:GoogleFonts.inknutAntiqua(color:Colors.black.withOpacity(0.5),
                            fontSize:15),)),
                      ),
                    ),
                  ],
                ),
              ),
             Container(height: 300,width: 270,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.black), color: Colors.white,),
             child: TextField(decoration: InputDecoration(border: InputBorder.none,
             
             ),
             style: GoogleFonts.inknutAntiqua(fontSize:15),maxLines: 100,
             ),
             )
            ],
          ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 200,
            child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){}, child: Text("Save", style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)))
            ],
          )

        ),
        )
    );
  }
}