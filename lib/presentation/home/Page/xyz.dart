import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class xyz extends HookConsumerWidget {
  const xyz({Key? key}) : super(key: key);

  static const route = '/xyz';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text("xyz"),
      ),
    );
  }
}
