class RoomId {
  String token;
  String uid;
  String anotherUserId;

  RoomId({required this.anotherUserId, required this.token, required this.uid});

  Map<String, dynamic> toJson() =>
      {"token": token, "uid": uid, "anotherUserId": anotherUserId};

  factory RoomId.fromJson(Map<String, dynamic> json) {
    return RoomId(
        anotherUserId: json["anotherUserId"],
        token: json["token"],
        uid: json["uid"]);
  }
}
