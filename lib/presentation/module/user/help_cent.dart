import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hopehub/presentation/module/user/boo.dart';
import 'package:hopehub/presentation/module/user/call.dart';
import 'package:hopehub/presentation/module/user/chat.dart';
import 'package:hopehub/presentation/module/user/sch.dart';

class helpcent extends StatefulWidget {
  const helpcent({super.key});

  @override
  State<helpcent> createState() => _helpcentState();
}

class _helpcentState extends State<helpcent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("Help Center",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: const PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,
             ),
             
             backgroundColor: Colors.grey[850],
             body:SingleChildScrollView(child: Column(children: [ 
              const SizedBox(height: 70,),
              
              Text("How can we help ?",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:25)),
             SizedBox(
            height: 70,width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: TextField(style: const   TextStyle(color: Colors.white),decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: const BorderSide(color: Colors.white)
              ),
              prefixIcon: const Icon(Icons.search,color: Colors.white,),
              hintText: "Search",hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ),),
            ),
          ), 


              
              Padding(
                padding: const EdgeInsets.only(top: 40),
                
                child:
                 ListTile(
                 onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const chats()));},
                 
                 leading:const Icon(Icons.chat_sharp,color: Colors.white,size: 30,),
                        title: Text("About Chats",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                        
                        ),
              ),
      const Divider(),
      ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const call()));},
        leading: const Icon(Icons.call,color: Colors.white,size: 30,),
      title: Text("About Call and Info",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      ),
      const Divider(),
      
      ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const sch()));},
        leading: const Icon(Icons.schedule,color: Colors.white,size: 30,),
      title: Text("Schedule",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      ),
      const Divider(),
      ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const boo()));},
        leading: const Icon(Icons.system_security_update_good_outlined,color: Colors.white,size: 30,),
      title: Text("Booking",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      
      ),
      const Divider(),
      
      ]),)
    );
  }
}