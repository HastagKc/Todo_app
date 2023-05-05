import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/model/todo.dart';

List<Todo> todos = [
  Todo(datetime: DateTime.now().toString(), label: 'Watching Movie '),
];

// creating an instance of the TodoProvider

final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>(
    (ref) => TodoProvider(todos));

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider(super.state);

  void add(Todo todo) {
    /* 
    List<int> list1 = [1, 2, 3];
    List<int> list2 = [4, 5, 6];
    List<int> combinedList = [...list1, ...list2];


    adding listof items to new combined list 
 */
    state = [...state, todo];
  }
}
