import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/mentor/mentrepo.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class mentpro extends StatefulWidget {
  const mentpro({super.key});

  @override
  State<mentpro> createState() => _mentproState();
}

class _mentproState extends State<mentpro> {
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
                  backgroundImage: AssetImage("assets/mentor.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Denies Thomas",
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 18),
              ),
            ),

            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mentpro()));
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
                      MaterialPageRoute(builder: (context) => menthome()));
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
                    context, MaterialPageRoute(builder: (context) => mentrepo()));
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
      body: Column(
        children: [
          Stack(
            children: [Image.asset("assets/mentbg.jpg",),Padding(
              padding: const EdgeInsets.only(left: 300,top: 280),
              child: CircleAvatar(radius: 25,backgroundColor: Colors.white,child: CircleAvatar(radius: 20,backgroundColor: Colors.blue,child: Icon(Icons.camera_alt_rounded,color: Colors.white,),),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110,top: 240 ),
              child: CircleAvatar(
                radius: 87,
                backgroundImage: AssetImage("assets/mentor.jpg",), 
                
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 340,left: 250),
              child: Stack(children: [CircleAvatar(radius: 25,backgroundColor: Colors.white, child: CircleAvatar(radius: 20,child:Icon(Icons.camera_alt_sharp,color: Colors.white,) , backgroundColor: Colors.blue,) )],),
            )
             
                
              
            ],
          ),
          Text("Denies Thomas",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:24),),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Msc Psychology",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          ),
           Text("5 years Experience",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          Text("English , Malayalam",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
         Text("denies@gmail.com",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 40),
            child: SizedBox(height: 40,width: 150,
              child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side:BorderSide(color: Colors.white))),backgroundColor:MaterialStatePropertyAll(Colors.amber[900])) ,onPressed: (){}, child: Text("share",style: GoogleFonts.inknutAntiqua(color:Colors.white),))),
          )
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(showSelectedLabels:true ,
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
        
      ],
      onTap: (index) {
        switch(index){
          case 0:
           Navigator.push(context, MaterialPageRoute(builder: (context)=>menthome()));
          case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mentrepo()));
          case 2:
           Navigator.push(context, MaterialPageRoute(builder: (context)=>mentpro()));
           

        }
      },backgroundColor: Colors.grey[850],

    )

    );
  }
}