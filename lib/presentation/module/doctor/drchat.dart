// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/presentation/module/doctor/doctor_report_page.dart';
// import 'package:hopehub/presentation/module/user/newrep.dart';
// // import 'package:hopehub/user/giverat.dart';
// import 'package:quickalert/quickalert.dart';

// class drchat extends StatefulWidget {
//   String patientId;
//   String bookId;
//   drchat({super.key, required this.patientId, required this.bookId});

//   @override
//   State<drchat> createState() => _chattingState();
// }

// class _chattingState extends State<drchat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           bottom: const PreferredSize(
//               preferredSize: Size.fromHeight(20), child: Divider()),
//           toolbarHeight: 80,
//           leading: Center(
//               child: Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.cancel,
//                       color: Colors.white,
//                       size: 40,
//                     ),
//                   ))),
//           title: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 25,
//                       backgroundImage: AssetImage("assets/Doctor.jpg"),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 100, left: 10),
//                         child: Text(
//                           "Dayana",
//                           style: GoogleFonts.inknutAntiqua(
//                               color: Colors.white, fontSize: 15),
//                         ),
//                       ),
//                       Text(
//                         "Last seen today 1 PM",
//                         style: GoogleFonts.inknutAntiqua(
//                             color: Colors.white, fontSize: 15),
//                       )
//                     ],
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ReportPage(
//                                   patientId: widget.patientId,
//                                   bookId: widget.bookId,
//                                 )));
//                       },
//                       child: const Text("Prescription"))
//                 ],
//               )),
//           // actions: [
//           //   Padding(
//           //     padding: EdgeInsets.only(right: 100),
//           //     // child: Icon(Icons.chat_outlined),
//           //   ),Text("Dayana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),)
//           //  ],
//         ),
//         backgroundColor: Colors.grey[850],
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                       height: 40,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(17),
//                         border: Border.all(width: 1, color: Colors.white),
//                         color: Colors.grey[800],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20, top: 10),
//                         child: Text(
//                           "Hello",
//                           style: GoogleFonts.inknutAntiqua(
//                               color: Colors.white, fontSize: 15),
//                         ),
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 150),
//                 child: Container(
//                     height: 40,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(17),
//                       border: Border.all(width: 1, color: Colors.white),
//                       color: Colors.grey[800],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 10),
//                       child: Text(
//                         "Hello",
//                         style: GoogleFonts.inknutAntiqua(
//                             color: Colors.white, fontSize: 15),
//                       ),
//                     )),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 470),
//                 child: Container(
//                   height: 50,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(17),
//                     border: Border.all(width: 1, color: Colors.white),
//                     color: Colors.grey[800],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.keyboard,
//                           color: Colors.white,
//                           size: 30.0, // Explicitly use double for clarity
//                         ),
//                         const SizedBox(
//                             width:
//                                 10.0), // Add spacing between icon and text field
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "Message",
//                               hintStyle: GoogleFonts.inknutAntiqua(
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(right: 10),
//                           child: Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
