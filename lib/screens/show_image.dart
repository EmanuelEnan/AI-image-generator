import 'package:flutter/material.dart';

import 'package:openai_image/services/image_service.dart';

import '../model/image_model.dart';

class ShowImage extends StatefulWidget {
  ShowImage({Key? key, required this.prompt})
      : super(key: key);

  String prompt;
  // String size;

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  ImageService imageService = ImageService();

  @override
  void initState() {
    imageService;
    super.initState();
  }

  @override
  void dispose() {
    imageService;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ImageModel>(
              future: imageService.postApi(widget.prompt),
              builder: ((context, snapshot) {
                // print('imageLink: ${snapshot.data!.data!}');
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            snapshot.data!.data!,
                            width: 400,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(snapshot.data!.text!),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              }),
            ),
          ),
        ],
      ),
    );
  }
}
