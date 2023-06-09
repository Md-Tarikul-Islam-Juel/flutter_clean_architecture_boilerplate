import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/theme.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_style.dart';
import '../../../../utils/size_constant.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/k_app_bar.dart';
import '../../../../widgets/k_list_tile.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState(ref.read(themeProvider).theme == "dark");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Settings',
      ),
      body: Column(
        children: [
          gap4,
          Padding(
            padding: paddingH10,
            child: KListTile(
              color: CustomColor.grey3,
              title: Text(
                KStrings.theme,
                style: CustomStyle.customStyleInstance.settingsTitleStyle,
              ),
              trailing: Switch(
                value: isDarkMode.value,
                onChanged: (value) {
                  isDarkMode.value = value;
                  ref.read(themeProvider).toggle(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
