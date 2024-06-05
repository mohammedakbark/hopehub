import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/login/login1.dart';
import 'package:hopehub/presentation/module/mentor/drsent.dart';
import 'package:hopehub/presentation/module/user/help.dart';
import 'package:hopehub/presentation/module/mentor/menthome.dart';
import 'package:hopehub/presentation/module/mentor/mentpro.dart';
import 'package:hopehub/presentation/module/user/newrep.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/settings.dart';

class mentrepo extends StatefulWidget {
  const mentrepo({super.key});

  @override
  State<mentrepo> createState() => _mentrepoState();
}

class _mentrepoState extends State<mentrepo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),

            Padding(
              padding: const EdgeInsets.only(right: 200, top: 20),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/ment.jpg"),
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
          ],
        ),
        backgroundColor: Colors.black,
      ),
      
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        // leading: Center(
        //   child: IconButton(onPressed: (){
        //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
        //     }, icon: Icon(Icons.menu,color: Colors.white,))
        //   // Icon(
        //   //   Icons.menu,
        //   //   color: Colors.white,
        //   // ),
        // ),
        title: Text(
          "Report",
          style: GoogleFonts.inknutAntiqua(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => notifictn()));
            },
            icon: Icon(
              Icons.notifications_on,
            ),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          
        ],
      ),
      backgroundColor: Colors.grey[850],
      body:SingleChildScrollView(child:  Padding(
        padding: const EdgeInsets.only(top: 40,left: 15),
        child: Column(children: [Container(
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
                        IconButton(onPressed: (){}, icon: Icon(Icons.download_for_offline,size: 25,color: Colors.white,),),
                         IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>drsent()));}, icon: Icon(Icons.send_sharp,size: 25,color: Colors.white,),)
                        
                      ],
                    ),
                  )
                ],
              )
              ],
              
              
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 320,left: 250),
          child: CircleAvatar(
            
            radius: 30,backgroundColor: Colors.white,child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>newrepo()));}, icon: Icon(Icons.add,color: Colors.black,size: 40,)),),
        )
        ],)
      ),),

       bottomNavigationBar: BottomNavigationBar(showSelectedLabels:true ,
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      selectedItemColor: Colors.amber[900],
      items: [
         BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,size: 30,),
        label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.contact_page_outlined,color: Colors.amber[900],size: 30,),
        label: "Report"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,size: 30,),
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