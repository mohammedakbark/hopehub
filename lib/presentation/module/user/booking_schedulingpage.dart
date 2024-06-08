import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/dr_model.dart';
import 'package:hopehub/data/firebase/booking_controller.dart';
import 'package:hopehub/data/firebase/controller.dart';
import 'package:hopehub/presentation/module/user/page_slote_package.dart';
import 'package:provider/provider.dart';

class ScedulingPage extends StatefulWidget {
  Drmodel drmodel;
  ScedulingPage({super.key, required this.drmodel});

  @override
  State<ScedulingPage> createState() => _ScedulingPageState();
}

class _ScedulingPageState extends State<ScedulingPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final whatsAppNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> data = [
    {"title": "Chat", "Icon": Icons.chat},
    {"title": "Call", "Icon": Icons.call},
    {"title": "Video Call", "Icon": Icons.videocam}
  ];
  int selectedbox = 0;

  // bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    TimeOfDay _selectedtime = TimeOfDay.now();

    void _showdatepicker() {
      showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(3000))
          .then((value) => setState(() {
                _dateTime = value!;
              }));
    }

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
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          title: Text(
            "Booking",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 17),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Details:",
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.amber[900], fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black)),
                        hintText: "Name",
                        hintStyle: GoogleFonts.inknutAntiqua(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black)),
                        hintText: "E Mail",
                        hintStyle: GoogleFonts.inknutAntiqua(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      controller: whatsAppNumber,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black)),
                        hintText: "Whatsapp Number",
                        hintStyle: GoogleFonts.inknutAntiqua(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  // : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mode_standby_rounded,
                          color: Colors.amber[900],
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Session Mode:",
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.amber[900], fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) => customeButton(
                            index: index,
                            title: data[index]["title"],
                            icons: data[index]["Icon"])),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side:
                                        const BorderSide(color: Colors.white))),
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.amber[900],
                            )),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const pay()));
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SlotePackagePage(
                                          bookingIdForReshedule: "",
                                          isRescheduling: false,
                                          isFreeBook: false,
                                          drName: nameController.text,
                                          drid: widget.drmodel.id!,
                                          email: emailController.text,
                                          name: nameController.text,
                                          whatsappnumber: whatsAppNumber.text,
                                        )));
                          }
                        },
                        child: Text(
                          "Book Slote",
                          style: GoogleFonts.inknutAntiqua(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  customeButton({
    required int index,
    required String title,
    required IconData icons,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Provider.of<BookingController>(context, listen: false)
              .changeSession(title);
          setState(() {
            selectedbox = index;
          });
        },
        child: Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            border: index == selectedbox
                ? Border.all(color: Colors.amber[900]!)
                : Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(7),
            color: Colors.transparent,
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Column(
                children: [
                  Icon(
                    icons,
                    color: Colors.amber[900],
                    size: 30,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.inknutAntiqua(
                        color: Colors.white, fontSize: 10),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
