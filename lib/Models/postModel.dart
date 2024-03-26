class postModel {
  String? name;
  String? text;
  String? tag;
  String? image;
  String? dateTime;
  bool? isVerficatifon;
  postModel({
    required this.name,
    required this.text,
    required this.tag,
    required this.image,
    required this.isVerficatifon,
  });

  postModel.fromjson(Map<String, dynamic>? json) {
    name = json!['name'];
    text = json['text'];
    tag = json['tag'];
    image = json['image'];
    isVerficatifon = json['isVerficatifon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'text': this.text,
      'tag': this.tag,
      'image': this.image,
      'isVerficatifon': this.isVerficatifon,
    };
  }
}
