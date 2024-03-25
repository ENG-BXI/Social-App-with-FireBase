class userModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? cover;
  String? bio;
  bool? isVerficatifon;
  userModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.image,
      required this.cover,
      required this.bio,
      required this.isVerficatifon});

  userModel.fromjson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isVerficatifon = json['isVerficatifon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'phone': this.phone,
      'image': this.image,
      'cover': this.cover,
      'bio': this.bio,
      'isVerficatifon': this.isVerficatifon,
    };
  }
}
