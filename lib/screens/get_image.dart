import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openai_image/controller/controller.dart';

import '../constants.dart';

class GetImage extends StatefulWidget {
  const GetImage({Key? key, required this.prompt}) : super(key: key);

  final String prompt;

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  final Constants constants = Constants();

  Controller controller = Get.put(Controller());
  @override
  void initState() {
    controller.postApi(widget.prompt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: const EdgeInsets.all(10),
                // scrollDirection: Axis.horizontal,
                children: [
                  Center(
                    child: Image.network(
                      controller.imageModel!.data1!,
                      // height: 500,
                      // width: 400,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image.network(
                      controller.imageModel!.data2!,
                      // height: 500,
                      // width: 400,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
