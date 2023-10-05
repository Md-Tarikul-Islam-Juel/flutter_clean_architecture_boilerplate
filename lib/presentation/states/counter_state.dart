import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterStateProvider = StateNotifierProvider<CounterState, Counter>(
      (ref) => CounterState(),
);

//immutable class
class Counter {
  final int counter1;
  final int counter2;

  Counter({required this.counter1, required this.counter2}) {
    print("child object create");
  }

  Counter copyWith({int? counter1, int? counter2}) {
    return Counter(
      counter1: counter1 ?? this.counter1,
      counter2: counter2 ?? this.counter2,
    );
  }
}

class CounterState extends StateNotifier<Counter> {
  CounterState() : super(Counter(counter1: 0, counter2: 0));

  void incrementCounter1() {
    state = state.copyWith(counter1: state.counter1 + 1);
  }

  void decrementCounter1() {
    state = state.copyWith(counter1: state.counter1 - 1);
  }

  void incrementCounter2() {
    state = state.copyWith(counter2: state.counter2 + 1);
  }

  void decrementCounter2() {
    state = state.copyWith(counter2: state.counter2 - 1);
  }
}