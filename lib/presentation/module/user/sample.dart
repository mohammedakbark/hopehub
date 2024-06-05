// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/user/giverat.dart';
// import 'package:quickalert/quickalert.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class chhhh extends StatefulWidget {
//   const chhhh({super.key});

//   @override
//   State<chhhh> createState() => _chattingState();
// }

// class _chattingState extends State<chhhh> {
//   double _rating = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(20),
//           child: Divider(),
//         ),
//         toolbarHeight: 80,
//         leading: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: Icon(Icons.cancel, color: Colors.white, size: 40),
//             ),
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 30,
//                 backgroundColor: Colors.white,
//                 child: CircleAvatar(
//                   radius: 25,
//                   backgroundImage: AssetImage("assets/Doctor.jpg"),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 100, left: 10),
//                     child: Text(
//                       "Dayana",
//                       style: GoogleFonts.inknutAntiqua(
//                           color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                   Text(
//                     "Last seen today 1 PM",
//                     style: GoogleFonts.inknutAntiqua(
//                         color: Colors.white, fontSize: 15),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey[850],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Your chat message rows here

//             Padding(
//               padding: const EdgeInsets.only(top: 470),
//               child: Container(
//                 height: 50,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(17),
//                   border: Border.all(width: 1, color: Colors.white),
//                   color: Colors.grey[800],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.keyboard,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                       const SizedBox(width: 10.0),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Message",
//                             hintStyle: GoogleFonts.inknutAntiqua(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: IconButton(
//                           icon: Icon(Icons.camera_alt, color: Colors.white, size: 30),
//                           onPressed: () {
//                             // Handle camera functionality
//                           },
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.star, color: Colors.white, size: 30),
//                         onPressed: () {
//                           _showRatingDialog(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _showRatingDialog(BuildContext context) {
//     QuickAlert.show(
//       context: context,
//       title: "Rate Your Experience",
//       content: RatingBar(
//         initialRating: _rating,
//         minRating: 1,
//         maxRating: 5,
//         onRatingUpdate: (rating) => setState(() => _rating = rating),
//         icon: Icon(
//   Icons.star,
//   color: Colors.amber, // Adjust color as desired
// ),
//       actions: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text(
//                 "Cancel",
//                 style: GoogleFonts.inknutAntiqua(color: Colors.white),
//               ),
//             ),
//             const SizedBox(width: 10.0),
//             TextButton(
//               onPressed: () {
//                 // Handle submitting the rating (optional)
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "Submit",
//                 style: GoogleFonts.inknutAntiqua(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }

