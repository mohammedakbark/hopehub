import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/user/giverat.dart';
import 'package:quickalert/quickalert.dart';

class chatting extends StatefulWidget {
  const chatting({super.key});

  @override
  State<chatting> createState() => _chattingState();
}

class _chattingState extends State<chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize:Size.fromHeight(20), child: Divider()),
        toolbarHeight: 80,
        leading: Center(child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(onPressed: (){
           
            showDialog(
              
              context: context, builder: (context)=>AlertDialog(actions: [
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,), onRatingUpdate: (rating){
                  print(rating);
                }),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Submit"))
            ],
            title: Text("Enter Your Rating",style: GoogleFonts.inknutAntiqua(fontSize:20),),
            

            
            
            
            
            )
            
            );
            
          },
           icon: Icon(Icons.cancel,color: Colors.white,size: 40,),)
        )),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              CircleAvatar(radius: 30,backgroundColor: Colors.white,child: CircleAvatar(radius: 25,backgroundImage: AssetImage("assets/Doctor.jpg"),),),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100,left: 10),
                    child: Text("Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
                  ),
                  Text("Last seen today 1 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)
                ],
              )
            ],
          )
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 100),
        //     // child: Icon(Icons.chat_outlined),
        //   ),Text("Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)
        //  ],

      ),
      backgroundColor: Colors.grey[850],
      body:SingleChildScrollView(child:  Column(children: [
        Row(
          children: [
            Container(height: 40,width: 200,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),border: Border.all(width: 1,color: Colors.white), color: Colors.grey[800],),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Text("Hello",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
            )
            ),
          ],
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Container(height: 40,width: 200,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),border: Border.all(width: 1,color: Colors.white), color: Colors.grey[800],),
          child: Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Text("Hello",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 470),
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),border: Border.all(width: 1,color: Colors.white), color: Colors.grey[800],),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
  children: [
    Icon(
      Icons.keyboard,
      color: Colors.white,
      size: 30.0, // Explicitly use double for clarity
    ),
    const SizedBox(width: 10.0), // Add spacing between icon and text field
    Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Message",
          hintStyle: GoogleFonts.inknutAntiqua(color: Colors.white),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(Icons.camera_alt,color: Colors.white,size: 30,),
    ),
    
  ],
),

            ),
          ),
        )
        
        
      ],),)
    );
  }
}