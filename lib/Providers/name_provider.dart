import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider =
    StateNotifierProvider<NameProvider, String>((ref) => NameProvider());

class NameProvider extends StateNotifier<String> {
  NameProvider() : super('Kshittiz');
}
