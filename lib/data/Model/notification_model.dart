class NotificationModel {
  String? notificationId;
  String fromId;
  String toId;
  String from;
  String to;
  String message;

  NotificationModel(
      {required this.from,
      required this.fromId,
      required this.message,
       this.notificationId,
      required this.to,
      required this.toId});

  Map<String, dynamic> toJosn(id) => {
        "from": from,
        "fromId": fromId,
        "message": message,
        "notificationId": id,
        "to": to,
        "toId": toId
      };
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        from: json["from"],
        fromId: json["fromId"],
        message: json["message"],
        notificationId: json["notificationId"],
        to: json["to"],
        toId: json["toId"]);
  }
}
