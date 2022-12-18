import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:openai_image/services/image_service.dart';

import '../model/image_model.dart';

class ShowImage extends StatefulWidget {
  ShowImage({Key? key, required this.prompt}) : super(key: key);

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
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Center(
                          child: ExtendedImage.network(
                            snapshot.data!.data1!,
                            width: 400,
                            height: 500,
                            fit: BoxFit.fill,
                            //enableLoadState: false,
                            mode: ExtendedImageMode.gesture,
                            initGestureConfigHandler: (state) {
                              return GestureConfig(
                                minScale: 0.9,
                                animationMinScale: 0.7,
                                maxScale: 3.0,
                                animationMaxScale: 3.5,
                                speed: 1.0,
                                inertialSpeed: 100.0,
                                initialScale: 1.0,
                                inPageView: false,
                                initialAlignment: InitialAlignment.center,
                              );
                            },
                          ),

                          // Image.network(
                          //   snapshot.data!.data1!,
                          //   width: 400,
                          //   height: 500,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Center(
                          child: ExtendedImage.network(
                            snapshot.data!.data2!,
                            width: 400,
                            height: 500,
                            fit: BoxFit.fill,
                            //enableLoadState: false,
                            mode: ExtendedImageMode.gesture,
                            initGestureConfigHandler: (state) {
                              return GestureConfig(
                                minScale: 0.9,
                                animationMinScale: 0.7,
                                maxScale: 3.0,
                                animationMaxScale: 3.5,
                                speed: 1.0,
                                inertialSpeed: 100.0,
                                initialScale: 1.0,
                                inPageView: false,
                                initialAlignment: InitialAlignment.center,
                              );
                            },
                          ),
                          // Image.network(
                          //   snapshot.data!.data2!,
                          //   width: 400,
                          //   height: 500,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ]);
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
