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
  

  Drmodel({
    required this.name,
    required this.qualification,
    required this.expert,
    required this.language,
    required this.phone,
    required this.email,
    required this.password,
    required this.imageUrl,
    this.id,

  });
  Map<String,dynamic>toMap(docid)=>{
    "name":name,
    "qualification":qualification,
    "expert":expert,
    "language":language,
    "phone":phone,
    "email":email,
    "password":password,
    "imageUrl":imageUrl,
    "id":docid
    
  };
  factory Drmodel.fromMap(Map<String,dynamic>data){
    return Drmodel(name: data["name"],
     qualification: data["qualification"],
      expert: data["expert"], 
      language: data["language"],
       phone: data["phone"],
        email: data["email"],
        password: data["password"],
        imageUrl: data["imageUrl"],
        id: data["id"]
        );
  }
}
