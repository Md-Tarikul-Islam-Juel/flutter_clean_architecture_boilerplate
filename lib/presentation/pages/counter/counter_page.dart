import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/strings.dart';
import '../../states/counter_hive_state.dart';
import '../../states/counter_state.dart';
import '../../states/counter_state.dart';

class CounterPage extends HookConsumerWidget {
  static const route = '/counterPage';

  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${counterState.counter1}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterStateProvider.notifier).incrementCounter1();
                  },
                  child: Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    final xyz = ref
                        .read(counterStateProvider.notifier)
                        .decrementCounter1();
                    // print("---------------------");
                    // print(xyz);
                    // print("---------------------");
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
