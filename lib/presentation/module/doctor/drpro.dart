import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/login/login1.dart';

import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class drprofile extends StatefulWidget {
  const drprofile({super.key});

  @override
  State<drprofile> createState() => _drprofileState();
}

class _drprofileState extends State<drprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
           Padding(
              padding: const EdgeInsets.only(right: 200, top: 20),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/dr3.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Dr.Dayana",
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 18),
              ),
            ),

            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drprofile()));
                },
                leading: Icon(
                  Icons.person,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text(
                  "Profile",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 15),
                )),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drhome()));
                },
                leading: Icon(
                  Icons.pending_actions_rounded,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text(
                  "My Schedule",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),

            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => drreport()));
              },
              leading: Icon(
                Icons.contact_page_outlined,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Report",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => setting()));
              },
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Settings",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => helps()));
              },
              leading: Icon(
                Icons.help,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Help",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            Divider(),
            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>logo1()));},
              leading: Icon(
                Icons.logout,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Logout",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            Divider(),
          ]
        ),
        
      ),
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(preferredSize:Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        // leading: Center(child: Padding(
        //   padding: const EdgeInsets.only(top: 20),
        //   child: Icon(Icons.menu,color: Colors.white,),
        // )),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Profile",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
        ),
        actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>notifictn()));}, icon: Icon(
            Icons.notifications_on,
            color: Colors.white,
          ),),
          Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
         ],

      ),
      backgroundColor: Colors.grey[850],
      body:SingleChildScrollView(child:  Column(
        children: [
          Stack(
            children: [Image.asset("assets/drbg.jpg"),
            Padding(
              padding: const EdgeInsets.only(left: 110,top: 180 ),
              child: CircleAvatar(radius: 90,backgroundColor: Colors.white,
              child: CircleAvatar(radius: 83,
                backgroundImage: AssetImage("assets/Doctor.jpg",), ),
                
                
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300,left: 240),
              child: Stack(children: [CircleAvatar(radius: 25,backgroundColor: Colors.white, child: CircleAvatar(radius: 20,child:Icon(Icons.camera_alt_sharp,color: Colors.white,size: 30,) , backgroundColor: Colors.blue,) )],),
            )
             
                
              
            ],
          ),
          Text("Dr.Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:24),),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Life Coach",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          ),
           Text("Relationship Problems",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          Text("English , Malayalam",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          Text("7845762110",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),Text("dayana@gmail.com",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 40),
            child: SizedBox(height: 40,width: 150,
              child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side:BorderSide(color: Colors.white))),backgroundColor:MaterialStatePropertyAll(Colors.amber[900])) ,onPressed: (){}, child: Text("share",style: GoogleFonts.inknutAntiqua(color:Colors.white),))),
          )
        ],
      ),),

      bottomNavigationBar: BottomNavigationBar(showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: 2,
      selectedItemColor: Colors.amber[900],

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,size: 30,),
        label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.contact_page_outlined,color: Colors.white,size: 30,),
        label: "Report"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.amber[900],size: 30,),
        label: "Profile"
        ),

      ],backgroundColor: Colors.grey[850],
      onTap: (index) {
        switch(index){
          case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>drhome()));
          case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>drreport()));
          case 2:
           Navigator.push(context, MaterialPageRoute(builder: (context)=>drprofile()));
           

        }
      },
      ),




    );
  }
}