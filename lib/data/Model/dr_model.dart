class Drmodel {
  String name;
  String qualification;
  String expert;
  String language;
  String phone;
  String email;
  String password;
  String imageUrl;
  String? id;
  num rating;

  Drmodel({
    required this.name,
    required this.rating,
    required this.qualification,
    required this.expert,
    required this.language,
    required this.phone,
    required this.email,
    required this.password,
    required this.imageUrl,
    this.id,
  });
  Map<String, dynamic> toMap(docid) => {
        "name": name,
        "rating": rating,
        "qualification": qualification,
        "expert": expert,
        "language": language,
        "phone": phone,
        "email": email,
        "password": password,
        "imageUrl": imageUrl,
        "id": docid
      };
  factory Drmodel.fromMap(Map<String, dynamic> data) {
    return Drmodel(
        rating: doctorRating(data["rating"]),
        name: data["name"],
        qualification: data["qualification"],
        expert: data["expert"],
        language: data["language"],
        phone: data["phone"],
        email: data["email"],
        password: data["password"],
        imageUrl: data["imageUrl"],
        id: data["id"]);
  }

  static doctorRating(rating) {
    switch (rating) {
      case >= 0 && < 20: //
        {
          return 1;
        }
      case >= 20 && < 40: //
        {
          return 2;
        }
      case >= 40 && < 60: //
        {
          return 3;
        }
      case >= 60 && < 80: //
        {
          return 4;
        }
      case > 80: //
        {
          return 5;
        }
    }
  }
}
