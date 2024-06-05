class MentorModel {
  String name;
  String qualification;
  String experience;
  String language;
  String phone;
  String email;
  String password;
  String? id;
  String doctorId;
  String profile;

  MentorModel(
      {required this.name,
      required this.profile,
      required this.qualification,
      required this.experience,
      required this.language,
      required this.phone,
      required this.email,
      required this.password,
      required this.doctorId,
      this.id});
  Map<String, dynamic> data(mentId) => {
        "name": name,
        "profile": profile,
        "doctorId":doctorId,
        "qualification": qualification,
        "experience": experience,
        "language": language,
        "phone": phone,
        "email": email,
        "password": password,
        "id": mentId
      };
  factory MentorModel.fromData(Map<String, dynamic> i) {
    return MentorModel(
      doctorId:i["doctorId"],
        profile: i['profile'],
        name: i["name"],
        qualification: i["qualification"],
        experience: i["experience"],
        language: i["language"],
        phone: i["phone"],
        email: i["email"],
        password: i["password"]);
  }
}
