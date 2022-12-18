import 'package:flutter/material.dart';

import 'get_image.dart';
import 'show_image.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController promptController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Options'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: promptController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'prompt description',
                  border: InputBorder.none,
                ),
              ),
              // TextField(
              //   controller: sizeController,
              // ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  var prompt = promptController.text;
                  var size = sizeController.text;
                  prompt.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetImage(
                              prompt: prompt,
                              // size: size,
                            ),
                          ),
                        )
                      : Container();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
