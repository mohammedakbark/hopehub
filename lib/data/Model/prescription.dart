class PrescriptionModel {
  String ?id;
  String uid;
  String drID;
  String metID;
  String prescription;

  PrescriptionModel(
      {required this.drID,
      required this.metID,
       this.id,
      required this.prescription,
      required this.uid});

  Map<String, dynamic> toJson(ids) => {
        "id": ids,
        "uid": uid,
        "metID": metID,
        "drID": drID,
        "prescription": prescription
      };

  factory PrescriptionModel.fromJosn(Map<String, dynamic> json) {
    return PrescriptionModel(
        metID: json["metID"],
        drID: json["drID"],
        id: json["id"],
        prescription: json["prescription"],
        uid: json["uid"]);
  }
}
