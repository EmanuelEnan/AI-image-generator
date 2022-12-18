import 'dart:convert';

import 'package:openai_image/constants.dart';
import 'package:openai_image/model/image_model.dart';
import 'package:http/http.dart' as http;

class ImageService {
  Constants constants = Constants();
  Future<ImageModel> postApi(String prompt) async {
    String url = constants.imgCreate;

    Map<String, String> param = {
      "prompt": prompt,
      // "size": size,
    };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.post(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: jsonEncode(param),
    );
    print(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final resp = response.body;
      // final resp = response.body;
      print(resp);
      Map<String, dynamic> services = jsonDecode(resp);

      // Map<String, dynamic> map = json.decode(resp);
      // List<dynamic> data = map["dataKey"];

      // return Employees.fromJson(jsonDecode(resp));
      // List service = jsonDecode(resp);

      // return service.map((json) => ImageModel.fromJson(json)).toList();

      return ImageModel.fromJson(services);
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
