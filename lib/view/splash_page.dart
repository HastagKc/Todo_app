import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app/view/home_page.dart';

class SplashPage extends StatelessWidget {
  // const SplashPage({super.key});

  final textContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: textContoller,
                decoration: const InputDecoration(
                  label: Text('Enter Your Name '),
                ),
                onFieldSubmitted: (val) {
                  textContoller.text = val;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    HomePage(
                      userName: textContoller.text,
                    ),
                    // arguments: textContoller.text,
                  );
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
