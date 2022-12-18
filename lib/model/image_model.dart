class ImageModel {
  String? data1;
  String? data2;

  String? text;

  ImageModel({this.data1, this.data2, this.text});

  // ImageModel.fromJson(Map<String, dynamic> json) {
  //   data = json['data'];
  //   text = json['text'];
  // }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      data1: json['data1'] ?? 'null',
      data2: json['data2'] ?? 'null',
      text: json['text'] ?? 'null',
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  <String, dynamic>{};
  //   data['data'] = this.data;
  //   data['text'] = text;
  //   return data;
  // }
}
