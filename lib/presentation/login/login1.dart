import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hopehub/login/loginpage.dart';
import 'package:hopehub/presentation/login/sign_in.dart';
import 'package:hopehub/presentation/login/loginpage.dart';

class logo1 extends StatefulWidget {
  const logo1({super.key});

  @override
  State<logo1> createState() => _logo1state();
}

class _logo1state extends State<logo1> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: TabBarView(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image1.jpg"), fit: BoxFit.cover)),
            child: Column(
              children: [
                // Image.asset("assets/capture1.jpg"),
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 600),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Trust that your stories are safe and secure with us",
                                  style: GoogleFonts.inriaSans(
                                      color: Colors.white,
                                      fontSize: 20,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          blurRadius: 7,
                                        )
                                      ])),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 240, 165, 67))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sign_in()));
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.inknutAntiqua(
                              color: Colors.white,
                            ),
                          ),
                          // style: ButtonStyle(backgroundColor:Color,)
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Center(
                          child: Row(
                            children: [
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  "Already have an account?",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          blurRadius: 7,
                                        )
                                      ]),
                                ),
                              )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.inknutAntiqua(
                                      color: Colors.amber[800],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image2.jpg"), fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 600),
                          child: Text(
                              "You're not alone. I'm here for you, always.",
                              style: GoogleFonts.inriaSans(
                                  color: Colors.white,
                                  fontSize: 20,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.black, blurRadius: 7)
                                  ])),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 240, 165, 67))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sign_in()));
                          },
                          child: Text(
                            "Sign up",
                            style:
                                GoogleFonts.inknutAntiqua(color: Colors.white),
                          ),
                          // style: ButtonStyle(backgroundColor:Color,)
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 60),
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          blurRadius: 7,
                                        )
                                      ]),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.inknutAntiqua(
                                        color: Colors.amber[800],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/capture3.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 600, left: 20),
                          child: Text(
                              "Instantly chat with experts any time of the day ",
                              style: GoogleFonts.inriaSans(
                                  color: Colors.white,
                                  fontSize: 20,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.black,
                                      blurRadius: 7,
                                    ),
                                  ])),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 240, 165, 67))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sign_in()));
                          },
                          child: Text(
                            "Sign up",
                            style:
                                GoogleFonts.inknutAntiqua(color: Colors.white),
                          ),
                          // style: ButtonStyle(backgroundColor:Color,)
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 60),
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          blurRadius: 7,
                                        )
                                      ]),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.inknutAntiqua(
                                        color: Colors.amber[800],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image 4.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 600, left: 20),
                          child: Text(
                              "You are stronger than you know, braver than you feel",
                              style: GoogleFonts.inriaSans(
                                  color: Colors.white,
                                  fontSize: 20,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.black,
                                      blurRadius: 7,
                                    )
                                  ])),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 240, 165, 67))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sign_in()));
                          },
                          child: Text(
                            "Sign up",
                            style:
                                GoogleFonts.inknutAntiqua(color: Colors.white),
                          ),
                          // style: ButtonStyle(backgroundColor:Color,)
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 60),
                              child: Row(
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: GoogleFonts.inknutAntiqua(
                                        color: Colors.white,
                                        shadows: [
                                          const Shadow(
                                            color: Colors.black,
                                            blurRadius: 7,
                                          )
                                        ]),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.inknutAntiqua(
                                          color: Colors.amber[800],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ]),
      ),
      // body: ListView(
      //   scrollDirection: Axis.horizontal,
      //       // DefaultTabController(length:4,
      //       //   child: TabBarView(

      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         // decoration: const BoxDecoration(
      //         //     image: DecorationImage(
      //         //         image: AssetImage("assets/Capture1.PNG"),
      //         //         fit: BoxFit.cover)),
      //         child:  Column(
      //           children: [
      //             SizedBox(
      //                 width: double.infinity,
      //                 child: Column(
      //                   // mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                         "Trust that your stories are safe and secure with us",style: GoogleFonts.inriaSans(color:Colors.black,fontSize:20,)),
      //                         Padding(padding: EdgeInsets.only(bottom:20)),
      //                         ElevatedButton(style:  ButtonStyle( shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 240, 165, 67))),
      //                           onPressed: (){
      //                            Navigator.push(context,MaterialPageRoute(builder: (context) => sign_in()));
      //                         }, child: Text("Sign up",style: GoogleFonts.inknutAntiqua(color:Colors.black),),
      //                         // style: ButtonStyle(backgroundColor:Color,)
      //                         ),
      //                         Padding(padding: EdgeInsets.only(bottom: 10)),
      //                         Center(
      //                           child: Row(
      //                             children: [
      //                               Text("Already have an account?",style: GoogleFonts.inknutAntiqua(color:Colors.black),),Text("Login",style: GoogleFonts.inknutAntiqua(color:Colors.amber[800],),
      //                           )
      //                             ],
      //                           ),
      //                         ),

      //                   ],
      //                 ))
      //           ],
      //         ),
      //       ),
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         // decoration: const BoxDecoration(
      //         //     image: DecorationImage(
      //         //         image: AssetImage("assets/capture2.jpg"),
      //         //         fit: BoxFit.cover)),
      //         child:  Column(
      //           children: [
      //             SizedBox(
      //                 width: double.infinity,
      //                 child: Column(
      //                   // mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                         "You're not alone. I'm here for you, always.",style: GoogleFonts.inriaSans(color:Colors.black,fontSize:20,)),
      //                         Padding(padding: EdgeInsets.only(bottom:20)),
      //                         ElevatedButton(style:  ButtonStyle( shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 240, 165, 67))),
      //                           onPressed: (){
      //                            Navigator.push(context,MaterialPageRoute(builder: (context) => sign_in()));
      //                         }, child: Text("Sign up",style: GoogleFonts.inknutAntiqua(color:Colors.black),),
      //                         // style: ButtonStyle(backgroundColor:Color,)
      //                         ),
      //                         Padding(padding: EdgeInsets.only(bottom: 10)),
      //                         Center(
      //                           child: Row(
      //                             children: [
      //                               Text("Already have an account?",style: GoogleFonts.inknutAntiqua(color:Colors.black),),Text("Login",style: GoogleFonts.inknutAntiqua(color:Colors.amber[800],),
      //                           )
      //                             ],
      //                           ),
      //                         ),

      //                   ],
      //                 ))
      //           ],
      //         ),
      //       ),
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         // decoration: const BoxDecoration(
      //         //     image: DecorationImage(
      //         //         image: AssetImage("assets/Capture3.PNG"),
      //         //         fit: BoxFit.cover)),
      //         child:  Column(
      //           children: [
      //             SizedBox(
      //                 width: double.infinity,
      //                 child: Column(
      //                   // mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                         "Instantly chat with experts any time of the day ",style: GoogleFonts.inriaSans(color:Colors.black,fontSize:20,)),
      //                         Padding(padding: EdgeInsets.only(bottom:20)),
      //                         ElevatedButton(style:  ButtonStyle( shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 240, 165, 67))),
      //                           onPressed: (){
      //                            Navigator.push(context,MaterialPageRoute(builder: (context) => sign_in()));
      //                         }, child: Text("Sign up",style: GoogleFonts.inknutAntiqua(color:Colors.black),),
      //                         // style: ButtonStyle(backgroundColor:Color,)
      //                         ),
      //                         Padding(padding: EdgeInsets.only(bottom: 10)),
      //                         Center(
      //                           child: Row(
      //                             children: [
      //                               Text("Already have an account?",style: GoogleFonts.inknutAntiqua(color:Colors.black),),Text("Login",style: GoogleFonts.inknutAntiqua(color:Colors.amber[800],),
      //                           )
      //                             ],
      //                           ),
      //                         ),

      //                   ],
      //                 ))
      //           ],
      //         ),
      //       ),
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         // decoration: const BoxDecoration(
      //         //     image: DecorationImage(
      //         //         image: AssetImage("assets/capture.jpg"),
      //         //         fit: BoxFit.cover)),
      //         child:  Column(
      //           children: [
      //             SizedBox(
      //                 width: double.infinity,
      //                 child: Column(
      //                   // mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                         "You are stronger than you know, braver than you feel",style: GoogleFonts.inriaSans(color:Colors.black,fontSize:20,)),
      //                         Padding(padding: EdgeInsets.only(bottom:20)),
      //                         ElevatedButton(style:  ButtonStyle( shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 240, 165, 67))),
      //                           onPressed: (){
      //                            Navigator.push(context,MaterialPageRoute(builder: (context) => sign_in()));
      //                         }, child: Text("Sign up",style: GoogleFonts.inknutAntiqua(color:Colors.black),),
      //                         // style: ButtonStyle(backgroundColor:Color,)
      //                         ),
      //                         Padding(padding: EdgeInsets.only(bottom: 10)),
      //                         Center(
      //                           child: Row(
      //                             children: [
      //                               Text("Already have an account?",style: GoogleFonts.inknutAntiqua(color:Colors.black),),Text("Login",style: GoogleFonts.inknutAntiqua(color:Colors.amber[800],),
      //                           )
      //                             ],
      //                           ),
      //                         ),

      //                   ],
      //                 ))
      //           ],
      //         ),
      //       ),

      //     ],
      //   ),
    );
  }
}
