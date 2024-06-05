import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/presentation/module/user/booking_schedulingpage.dart';

class BookingDoctorDetailsPage extends StatefulWidget {
  Drmodel doctor;
  BookingDoctorDetailsPage({super.key, required this.doctor});

  @override
  State<BookingDoctorDetailsPage> createState() =>
      _BookingDoctorDetailsPageState();
}

class _BookingDoctorDetailsPageState extends State<BookingDoctorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            )),
        // bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider(),
        // ),toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/dr_bg.jpg"),
              const Padding(
                padding: EdgeInsets.only(left: 130, top: 150),
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 134, top: 154),
                    child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(widget.doctor.imageUrl)),
                  )
                ],
              )
            ],
          ),
          Text(
            widget.doctor.name,
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.doctor.qualification,
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
            ),
          ),
          Text(
            widget.doctor.expert,
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.system_security_update_good_rounded,
                          color: Colors.amber[900],
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Book Session",
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.amber[900], fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: Text(
                      "Booking are available for chat,call,or video call",
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, top: 30),
                    child: Text(" 60 minutes",
                        style: GoogleFonts.inknutAntiqua(
                            color: Colors.white, fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, top: 10),
                    child: Text("₹ 150",
                        style: GoogleFonts.inknutAntiqua(
                            color: Colors.white, fontSize: 15)),
                  ),
                  SizedBox(
                      // height: 30,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(color: Colors.white),
                              )),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber[900]),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           ScedulingPage(drmodel: widget.doctor,)));
                            },
                            child: Text(
                              "Book",
                              style: GoogleFonts.inknutAntiqua(
                                  color: Colors.white, fontSize: 15),
                            )),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
