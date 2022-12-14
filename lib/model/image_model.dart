class ImageModel {
  String? data;
  String? text;

  ImageModel({this.data, this.text});

  // ImageModel.fromJson(Map<String, dynamic> json) {
  //   data = json['data'];
  //   text = json['text'];
  // }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      data: json['data'],
      text: json['text'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  <String, dynamic>{};
  //   data['data'] = this.data;
  //   data['text'] = text;
  //   return data;
  // }
}
