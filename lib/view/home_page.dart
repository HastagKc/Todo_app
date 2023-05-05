import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  final time = DateTime.now();

  // final userName = Get.arguments;
  final String userName;
  HomePage({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: time.hour > 12
            ? Text('Good Evening $userName')
            : Text('Good Morning $userName'),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
