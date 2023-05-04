import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Providers/name_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);

          final dateTime = DateTime.now();
          return dateTime.hour > 12
              ? Text(
                  'Good evening $name',
                )
              : Text('Good Morning $name');
        }),
      ),
    );
  }
}
