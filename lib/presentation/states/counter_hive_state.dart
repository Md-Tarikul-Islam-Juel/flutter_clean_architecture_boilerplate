import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/strings.dart';

final counterHiveStateProvider =
    StateNotifierProvider<CounterHiveState, CounterHive>(
  (ref) => CounterHiveState(KStrings.counterBox),
);

//immutable class
class CounterHive {
  final int counter;

  CounterHive({required this.counter}) {
    // print("child object create");
  }

  CounterHive copyWith({int? counter}) {
    return CounterHive(counter: counter ?? this.counter);
  }
}

class CounterHiveState extends StateNotifier<CounterHive> {
  final String BoxName;

  CounterHiveState(this.BoxName) : super(CounterHive(counter: 0)) {
    // print("parent object create");
    init();
  }

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      state =
          state.copyWith(counter: await _get(KStrings.counterState, 0) ?? 0);
    } catch (e) {
      print(e);
    }
  }

  Future<void> decrementCounter(int value) async {
    try {
      state = state.copyWith(counter: state.counter - value);
      await _put(KStrings.counterState, state.counter);
    } catch (e) {
      print(e);
    }
  }

  Future<void> incrementCounter(int value) async {
    try {
      state = state.copyWith(counter: state.counter + value);
      await _put(KStrings.counterState, state.counter);
    } catch (e) {
      print(e);
    }
  }

  Future<int> _get(String key, int? defaultValue) async {
    final box = await Hive.openBox(BoxName);
    // When no value is found, it will return the defaultValue (defaulting 0/false ....)
    return await box.get(key, defaultValue: defaultValue);
  }

  Future<void> _put(String key, int value) async {
    final box = await Hive.openBox(BoxName);

    //now put value
    await box.put(key, value);
  }
}
