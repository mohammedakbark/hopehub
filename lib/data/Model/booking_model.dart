class BookingModel {
  String bookingid;
  String patientName;
  String email;
  String whatsApp;
  String sessionMode;
  String bookingTime;
  String bookingEndTime;

  String doctorid;
  String userid;
  String status;
  String payment;

  BookingModel({
    required this.sessionMode,
    required this.whatsApp,
    required this.email,
    required this.bookingid,
    required this.patientName,
    required this.bookingTime,
    required this.bookingEndTime,
    required this.doctorid,
    required this.userid,
    required this.status,
    required this.payment
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      payment:map["payment"] ,status:map["status"] ,
      sessionMode: map["sessionMode"],
      email: map["email"],
      whatsApp: map["whatsApp"],
      bookingid: map['bookingid'],
      patientName: map['patientName'],
      bookingTime: map['bookingTime'],
      bookingEndTime: map['bookingEndTime'],
      doctorid: map['doctorid'],
      userid: map['userid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status':status,
      'payment':payment,
      'sessionMode': sessionMode,
      'email': email,
      'whatsApp': whatsApp,
      'bookingid': bookingid,
      'patientName': patientName,
      'bookingTime': bookingTime,
      'bookingEndTime': bookingEndTime,
      'doctorid': doctorid,
      'userid': userid,
    };
  }
}
