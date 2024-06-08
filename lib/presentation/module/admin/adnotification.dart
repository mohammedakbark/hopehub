import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class adnoti extends StatefulWidget {
  const adnoti({super.key});

  @override
  State<adnoti> createState() => _adnotiState();
}

class _adnotiState extends State<adnoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              )),
          title: Text(
            "Review",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.grey[850],
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.forward_to_inbox_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.transparent),
                        height: 350,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 600,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    color: Colors.transparent),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 20),
                                  child: Text(
                                    "catherine@gmail.com",
                                    style: GoogleFonts.inknutAntiqua(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "THANK YOU... I would not hesitate to recommend you. My sessions were incredibly beneficial. My therapist “Denies Thomas and  Dr.Dayana” immediately made me feel at ease discussing my issues and was able to help identify and dissect the background to my problems.",
                                style: GoogleFonts.inknutAntiqua(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
