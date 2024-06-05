import 'package:cloud_firestore/cloud_firestore.dart';

class Drfuntion{
  Future addDoctorDetails(Map<String,dynamic>doctorInfoMap,String id)async{
    return await FirebaseFirestore.instance
    .collection("Doctor")
    .doc(id)
    .set(doctorInfoMap);
  }
}