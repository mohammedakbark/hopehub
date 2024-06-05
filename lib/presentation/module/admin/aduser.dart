import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class aduser extends StatefulWidget {
  const aduser({super.key});

  @override
  State<aduser> createState() => _aduserState();
}

class _aduserState extends State<aduser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        title: Text("Patient Details",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),),
        bottom: PreferredSize(preferredSize:Size.fromHeight(20) , child: Divider()),
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.grey[850],
      body: Expanded(child: ListView.builder(itemCount: 5,itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            // height: 200,
            // width: 200,
            height: 200,
            width: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.white,width: 1),color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 45,backgroundColor: Colors.white,child: CircleAvatar(radius: 40,backgroundImage: AssetImage("image/user.jpg"),),),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text("Catherine",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15), ),
                            
                            
                            Text("7654321890",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15), ),
                            
                           
                            Text("catherine@gmail.com",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15) ),
                        
                        
                        
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Doctor Name: Dr.Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                  ),
                  Text("mentor Name: Denies Thomas",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15))
                ],
              ),
            ),
            
            ),
        );
      }))),
    );
  }
}