import 'package:app/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingValueProvider = FutureProvider<String>((ref) {
  return ref.watch(userGreetingProvider).getUserGreeting();
});

class GreetingWidget extends ConsumerWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(greetingValueProvider);

    return value.when(
      data: (data) => Column(
        children: [
          const Icon(
            Icons.sunny,
            size: 80,
          ),
          Text(
            data,
            style: const TextStyle(fontSize: 64),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: ((error, stackTrace) => const Text('Error')),
    );
  }
}
