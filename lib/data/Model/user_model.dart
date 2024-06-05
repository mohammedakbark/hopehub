
//collection
class UserModel {
  String name;
  String email;
  String phone;
  String address;
  String? imageUrl;
  String? id;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.imageUrl,
    this.id,
  });


  Map<String, dynamic> toMap(ids) => {
        "name": name,
        "email": email,
        "id": ids,
        "phone": phone,
        "address":address,
        "imageUrl": imageUrl,
      };

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      address: data["address"],
      imageUrl: data["imageUrl"],
      id: data["id"],
    );
  }
}