import 'package:app/ui/greeting_widget.dart';
import 'package:app/ui/name_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const setNameButton = Key('setNameButton');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const GreetingWidget(),
            ElevatedButton(
              key: setNameButton,
              child: const Text('Set Name'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const NamePage()))
                    .whenComplete(() {
                  ref.refresh(greetingValueProvider);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
