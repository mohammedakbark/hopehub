// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/presentation/module/user/page_home.dart';
// import 'package:hopehub/presentation/login/login1.dart';
// import 'package:hopehub/presentation/module/user/connection.dart';
// import 'package:hopehub/presentation/module/user/help.dart';
// import 'package:hopehub/presentation/module/user/notification.dart';
// import 'package:hopehub/presentation/module/user/payment.dart';

// import 'package:hopehub/presentation/module/user/page_profilepage.dart';
// import 'package:hopehub/presentation/module/user/feedback.dart';
// import 'package:hopehub/presentation/module/user/settings.dart';

// class mentsche extends StatefulWidget {
//   const mentsche({super.key});

//   @override
//   State<mentsche> createState() => _mentscheState();
// }

// class _mentscheState extends State<mentsche> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[850],

//         drawer: Drawer(
        
//         child: ListView(
          
//           children: [
//           // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),
         
//          Padding(
//            padding: const EdgeInsets.only(right: 200,top: 20),
//            child: CircleAvatar(
//             radius: 45,
//             backgroundColor: Colors.white,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage("assets/user.jpg"), ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 10,left: 10),
//            child: Text("Catherine",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
//          ),
        
// ListTile( 
//   onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));} ,
//   leading: Icon(Icons.person,size:30 ,),
//   iconColor: Colors.amber[900],
//   title: Text("Profile",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)
// ),
// Divider()
// ,ListTile( 
//   onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
//     leading: Icon(Icons.system_security_update_good_rounded,size:30 ,),
//     iconColor: Colors.amber[900],
//     title:
   
//        Text("My Booking",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,),)),
  
//   Divider(),
//   ListTile(
//     onTap: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>pay()));
//     },
//     leading: Icon(Icons.payment_rounded,size: 30,),
//     iconColor: Colors.amber[900],
//     title: Text("Payment",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),

//   ),
//   Divider(),
//   ListTile(
//     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));},
//     leading: Icon(Icons.person_add_alt_1,size: 30,),
//     iconColor: Colors.amber[900],
//     title: Text("Review",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),

//   ),
//   Divider(),
//   ListTile(
//     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()));},
//     leading: Icon(Icons.settings,size: 30,),
//     iconColor: Colors.amber[900],
//     title: Text("Settings",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),

//   ),
//   Divider(),
//   ListTile(
//     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>helps()));},
//     leading: Icon(Icons.help,size: 30,),
//     iconColor: Colors.amber[900],
//     title: Text("Help",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),

//   ),
//   Divider(),
//   ListTile(
//     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>logo1()));},
//     leading: Icon(Icons.logout,size: 30,),
//     iconColor: Colors.amber[900],
//     title: Text("Logout",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15,)),

//   ),
//   Divider(),

//           ],),
//         backgroundColor: Colors.black,),


//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           bottom: PreferredSize(
//               preferredSize: Size.fromHeight(20), child: Divider()),
//           toolbarHeight: 50,
//           // leading: Center(
//           //     child: Padding(
//           //   padding: const EdgeInsets.only(top: 20),
//           //   child: Icon(
//           //     Icons.menu,
//           //     color: Colors.white,
//           //   ),
//           // )),
//           title: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Text(
//               "Schedule",
//               style:
//                   GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
//             ),
//           ),
//           actions: [
//             IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>notifictn()));}, icon: Icon(
//               Icons.notifications_on,
//               color: Colors.white,
//             ),),
//             Padding(
//               padding: EdgeInsets.all(8),
//               // child: Icon(Icons.chat_outlined),
//             ),
//            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>connection()));}, icon:  Icon(
//               Icons.chat_outlined,
//               color: Colors.white,
//             ),)
//           ],
//         ),
//         body: Column(
          
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 30, left: 10),
//               child: Text(
//                 "Your available Schedule",
//                 style: GoogleFonts.inknutAntiqua(
//                     color: Colors.amber[900], fontSize: 20),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 30),
//               child: Container(
//                   width: 350,
//                   height: 300,
//                   // color: Colors.black,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(7)),
//                   child: Column(
                    
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 10, top: 10),
//                               child: CircleAvatar(
//                                 radius: 70,
//                                 backgroundImage:
//                                     AssetImage("assets/mentor.jpg"),
//                               )
//                               // Image.asset("assets/mentor.jpg"),
        
//                               ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 60, top: 10),
//                                 child: Text(
//                                   "Denies Thomas",
//                                   style: GoogleFonts.inknutAntiqua(
//                                       color: Colors.white, fontSize: 15),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 36),
//                                 child: Text("counselor",
//                                     style: GoogleFonts.inknutAntiqua(
//                                         color: Colors.white, fontSize: 15)),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 42),
//                                 child: Text(" call",
//                                     style: GoogleFonts.inknutAntiqua(
//                                         color: Colors.white, fontSize: 15)),
//                               ),
//                               Row(
//                                 children: [
//                                   Text("Today:",
//                                       style: GoogleFonts.inknutAntiqua(
//                                           color: Colors.white, fontSize: 15)),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Text("2.00 AM",
//                                         style: GoogleFonts.inknutAntiqua(
//                                             color: Colors.white,
//                                             fontSize: 15)),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                      SizedBox(height: 10,), 
//                       SizedBox(
//                         height: 50,
                       
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 50,),
//                           child: ListView.separated(
//                             scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) {
//                                 return CircleAvatar(backgroundColor: Colors.black,
//                                 child: Text((index + 1).toString(),style: TextStyle(color: Colors.white),),
//                                 );
                                
//                               },
//                               separatorBuilder: (context, index) {
//                                 return Center(
//                                   child: Container(
//                                     width: 10,
//                                     height: 1,
//                                     color: Colors.white,
//                                   ),
//                                 );
//                               },
//                               itemCount: 5),
//                         ),
//                       ),

//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 60,top: 20 ),
//                             child: SizedBox(
//                               height: 30,
//                               width: 120,
//                               child: ElevatedButton(
//                                   style: ButtonStyle(
//                                       shape: MaterialStatePropertyAll(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(7),
//                                               side: BorderSide(
//                                                   color: Colors.white))),
//                                       backgroundColor:
//                                           MaterialStatePropertyAll(
//                                               Colors.amber[900])),
//                                   onPressed: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>pay()));
//                                   },
//                                   child: Text(
//                                     "Confirm",
//                                     style: GoogleFonts.inknutAntiqua(
//                                         color: Colors.white, fontSize: 10),
//                                   )),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20,top: 20 ),
//                             child: SizedBox(
//                               height: 30,
//                               width: 120,
//                               child: ElevatedButton(
//                                   style: ButtonStyle(
//                                       shape: MaterialStatePropertyAll(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(7),
//                                               side: BorderSide(
//                                                   color: Colors.white))),
//                                       backgroundColor:
//                                           MaterialStatePropertyAll(
//                                               Colors.amber[900])),
//                                   onPressed: () {},
//                                   child: Text(
//                                     "Cancel",
//                                     style: GoogleFonts.inknutAntiqua(
//                                         color: Colors.white, fontSize: 10),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ));
//   }
// }
