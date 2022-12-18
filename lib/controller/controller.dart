import 'dart:convert';

import 'package:get/get.dart';
import 'package:openai_image/model/image_model.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Controller extends GetxController {
  var isLoading = false.obs;
  ImageModel? imageModel;
  Constants constants = Constants();
  // String? prompt;

  // @override
  // void onInit() async{
  //   super.onInit();
  //   postApi(prompt!);
  // }

  postApi(String prompt) async {
    String url = constants.imgCreate;

    Map<String, String> param = {
      "prompt": prompt,
      // "size": size,
    };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    try {
      isLoading(true);

      final response = await http.post(
        uri,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: jsonEncode(param),
      );
      print(url);

      if (response.statusCode == 200) {
        print(response.statusCode);
        final resp = response.body;

        print(resp);

        var result = jsonDecode(resp);

        imageModel = ImageModel.fromJson(result);

        //
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
