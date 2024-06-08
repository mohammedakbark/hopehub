import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/firebase/booking_controller.dart';
import 'package:hopehub/data/firebase/controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/data/firebase/payment_service.dart';
import 'package:hopehub/presentation/login/loginpage.dart';
import 'package:hopehub/presentation/module/admin/adhome.dart';
import 'package:hopehub/business_logic/firebase_options.dart';

import 'package:hopehub/presentation/login/logo.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookingController>(create: (_)=>BookingController()),
                ChangeNotifierProvider<PaymentController>(create: (_)=>PaymentController()),
                                ChangeNotifierProvider<DbController>(create: (_)=>DbController())


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 63, 8, 80)),
          useMaterial3: true,
        ),
        home: logo(),
        // home: drhome(),
      ),
    );
  }
}
