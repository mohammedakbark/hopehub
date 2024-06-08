import 'dart:developer';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:intl/intl.dart';

class BookingController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final now = DateTime.now();
  String sessionMode = "Chat";

  changeSession(newSession) {
    sessionMode = newSession;
    log(sessionMode);
  }

  BookingModel? _bookingModel;
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  List<BookingModel> myBookings = [];

  late BookingService? mockBookingService;
  List<DateTimeRange> converted = [];
  String? _doctorId;

  getMyBookingsForConvert() async {
    log(_doctorId.toString());
    final snapshot = await db
        .collection("doctor")
        .doc(_doctorId)
        .collection("bookings")
        .get();

    myBookings =
        snapshot.docs.map((e) => BookingModel.fromMap(e.data())).toList();
  }

  Future init(
      String doctorName, userName, doctorID, userEmail, whatsappnumber) async {
    _doctorId = doctorID;
    mockBookingService = BookingService(
        userName: userName,
        servicePrice: 130,
        serviceId: doctorID,
        userId: auth.currentUser!.uid,
        userEmail: userEmail,
        userPhoneNumber: whatsappnumber,
        bookingEnd: DateTime(now.year, now.month, now.day, 17, 30),
        bookingStart: DateTime(now.year, now.month, now.day, 9, 0),
        serviceName: doctorName,
        serviceDuration: 30);
  }

  // final tim = TimeOfDay.now();
  // final now="${tim.hour}"

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    getMyBookingsForConvert();
    converted = myBookings
        .where((element) => element.doctorid == _doctorId)
        .map((booking) => DateTimeRange(
            start: DateTime.parse(booking.bookingTime),
            end: DateTime.parse(booking.bookingEndTime)))
        .toList();
    log(converted.toString());

    return converted;
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 13, 0),
          end: DateTime(now.year, now.month, now.day, 14, 30))
    ];
  }

  Future<BookingService> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));

    log(converted.length.toString());
    String formatttedDate =
        DateFormat('dd-MM-yy').format(newBooking.bookingStart);
    print('////////////$formatttedDate/////////');
    return newBooking;
  }

  Future bookNewSchedule(BookingService newBooking) async {
    _bookingModel = BookingModel(
        status: "Pending",
        payment: "130",
        bookingid: newBooking.bookingStart.toString(),
        patientName: newBooking.userName ?? 'unknown',
        bookingTime: newBooking.bookingStart.toString(),
        bookingEndTime: newBooking.bookingEnd.toString(),
        doctorid: newBooking.serviceId.toString(),
        userid: newBooking.userId.toString(),
        email: newBooking.userEmail.toString(),
        sessionMode: sessionMode,
        whatsApp: newBooking.userPhoneNumber.toString());
    print('////////////${newBooking.serviceId}');
    await firebaseFirestore
        .collection('doctor')
        .doc(newBooking.serviceId)
        .collection('bookings')
        .doc(newBooking.bookingStart.toString())
        .set(_bookingModel!.toMap());
    await firebaseFirestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('bookings')
        .doc(newBooking.bookingStart.toString())
        .set(_bookingModel!.toMap());

    print('/////////Uploaded successfully');
  }

 Future recheduleDoctor(bookingId, doctorId, BookingService newBooking)async {
    DbController().cancelMyBooking(bookingId, doctorId);
    bookNewSchedule(newBooking);
  }
}
