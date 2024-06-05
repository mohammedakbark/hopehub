//       bottomNavigationBar: packages(indexnum: 2),

// bottomNavigationBar: BottomNavigationBar(
//   showUnselectedLabels: true,

//   type: BottomNavigationBarType.fixed,
//   currentIndex: 2,
//   selectedItemColor: Colors.amber[900],

//   items: [
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.home,
//         color: Colors.white,
//         size: 30,
//       ),
//       label: "Home",
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.pending_actions_rounded,
//         color: Colors.white,
//         size: 30,
//       ),
//       label: "Schedule",
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.payment_rounded,
//         color: Colors.amber[900],
//         size: 30,
//       ),
//       label: "Payment",
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.person_2_sharp,
//         color: Colors.white,
//         size: 30,
//       ),
//       label: "Profile",
//     )
//   ],
//   onTap: (index) {

//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   project()), // Replace with your ChatPage widget
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   schedle()), // Replace with your ChannelsPage widget
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   pay()), // Replace with your WorknowPage widget
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   profile()), // Replace with your ServicesPage widget
//         );
//         break;
//     }
//   },
//   backgroundColor: Colors.transparent,

// ),
//     );
//   }
// }
import 'dart:developer';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/firebase/booking_controller.dart';
import 'package:hopehub/presentation/module/user/connection.dart';
import 'package:hopehub/presentation/module/user/menu.dart';
import 'package:hopehub/presentation/module/user/notification.dart';
import 'package:hopehub/presentation/module/user/package.dart';
import 'package:hopehub/presentation/module/user/success.dart';

class pay extends StatefulWidget {
  BookingService newBooking;
  pay({super.key, required this.newBooking});

  @override
  State<pay> createState() => _payState();
}

class _payState extends State<pay> {
  @override
  Widget build(BuildContext context) {
    log(widget.newBooking.toString());
    return Scaffold(
      drawer: const menuss(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
        title: Text(
          "Payment",
          style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const notifictn()));
            },
            icon: const Icon(
              Icons.notifications_on,
            ),
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const connection()));
            },
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 10),
              child: Image.asset("assets/gpay-removebg-preview.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              child: TextField(
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white)),
                  prefixStyle: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 20),
                  prefixText: "To:",
                  hintStyle: GoogleFonts.inknutAntiqua(
                      color: Colors.white.withOpacity(0.5), fontSize: 20),
                  hintText: "Email@gmail.com",
                ),
              ),
            ),
            //TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white))),)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.black),
                  height: 200,
                  width: 300,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60, left: 100),
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber[900])),
                      onPressed: () {
                        BookingController()
                            .bookNewSchedule(widget.newBooking)
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const success()));
                        });
                      },
                      child: Text(
                        "Pay",
                        style: GoogleFonts.inknutAntiqua(color: Colors.white),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
