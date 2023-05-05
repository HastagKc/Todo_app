import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/Providers/todo_provider.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatelessWidget {
  final time = DateTime.now();

  // final userName = Get.arguments;
  final String userName;
  HomePage({required this.userName});

  // creating textController
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: time.hour > 12
            ? Text('Good Evening $userName')
            : Text('Good Morning $userName'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer(
            builder: (context, ref, child) {
              final todos = ref.watch(todoProvider);
              return Column(
                children: [
                  TextFormField(
                    controller: textController,
                    onFieldSubmitted: (value) {
                      // creating instance of the list then added into the list
                      final newTodo = Todo(
                        datetime: DateTime.now().toString(),
                        label: value,
                      );
                      ref.read(todoProvider.notifier).add(newTodo);

                      textController.clear();
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(todos);
                        return Card(
                          child: ListTile(
                            title: Text(
                              todos[index].label,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(todos[index].datetime),
                            trailing: Container(
                              width: 99,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(todoProvider.notifier)
                                          .deleteTodo(todos[index]);
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
