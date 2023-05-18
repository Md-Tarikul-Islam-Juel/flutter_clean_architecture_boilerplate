import 'package:flutter_hooks/flutter_hooks.dart';

class CounterState {
  final _count = useState<int>(0);

  int get count => _count.value;

  void increment() {
    _count.value++;
  }

  void decrement() {
    _count.value--;
  }
}
