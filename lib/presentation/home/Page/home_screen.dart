import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/k_app_bar.dart';
import '../../drawer/side_menu.dart';
import '../widget/counter/page/counter.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      drawer: Drawer(
        width: 80.w,
        child: const SideMenu(),
      ),
      body: Counter(),
    );
  }
}
