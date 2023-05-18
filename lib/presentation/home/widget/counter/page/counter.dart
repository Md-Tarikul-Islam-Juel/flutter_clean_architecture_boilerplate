import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Page/xyz.dart';
import '../state/counterState.dart';

class Counter extends HookConsumerWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = CounterState();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${counterState.count}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: counterState.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: counterState.decrement,
              child: const Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(xyz.route);
              },
              child: const Text('next page'),
            ),
          ],
        ),
      ),
    );
  }
}
