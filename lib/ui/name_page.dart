import 'package:app/logic/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NamePage extends HookConsumerWidget {
  const NamePage({Key? key}) : super(key: key);

  static const textField = Key('textField');
  static const confirmButton = Key('confirmButton');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My login screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextFormField(
              key: textField,
              controller: controller,
              decoration: const InputDecoration(hintText: 'My name'),
              onChanged: (value) => controller.text = value,
            ),
          ),
          ElevatedButton(
            key: confirmButton,
            onPressed: () {
              ref.read(userRepositoryProvider).setName(controller.text);
              Navigator.of(context).pop();
            },
            child: const Text('Set Name'),
          )
        ],
      ),
    );
  }
}
