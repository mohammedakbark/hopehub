import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/module/user/menu.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuss(),
      appBar: AppBar(backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize: Size.fromHeight(25), child: Divider()),
      toolbarHeight: 45,
      leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu,color: Colors.white,size: 25,));
        }
      ),
      ),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(child: Column(children: [
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white), color: Colors.black,),
           
            height: 200,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 30,left: 30,bottom: 20),
              child: Row(
                      
                children: [Image.asset("assets/report.jpg"),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Catherine.pdf",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 78,left: 80),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.download_for_offline,size: 25,color: Colors.white,),),
                          ),
                          //  IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>mentsent()));}, icon: Icon(Icons.send_sharp,size: 25,color: Colors.white,),)
                          
                        ],
                      ),
                    )
                  ],
                )
                ],
                
                
              ),
            ),
          ),
        ),
       
      ],),),
    );
  }
}