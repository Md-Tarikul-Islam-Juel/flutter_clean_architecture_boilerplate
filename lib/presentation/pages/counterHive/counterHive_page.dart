import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/counter_hive_state.dart';

class CounterHivePage extends HookConsumerWidget {
  static const route = '/CounterHivePage';

  const CounterHivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterHiveState = ref.watch(counterHiveStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Hive Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${counterHiveState.counter}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterHiveStateProvider.notifier)
                        .incrementCounter(5);
                  },
                  child: Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterHiveStateProvider.notifier)
                        .decrementCounter(5);
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
