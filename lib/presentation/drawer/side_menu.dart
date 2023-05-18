import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/utils/text_theme_style_x.dart';

import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/drawer/useCase/rive_asset.dart';
import '../../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends HookConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = useState(sideMenus.first);
    return Scaffold(
      body: Container(
        width: 80.w,
        height: double.infinity,
        color: context.color.primary,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Tarikul Islam Juel",
                profession: "Software Engineer",
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 4.h, bottom: 2.h),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });

                    selectedMenu.value = menu;
                  },
                  isActive: selectedMenu.value == menu,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 4.h, bottom: 2.h),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    selectedMenu.value = menu;
                  },
                  isActive: selectedMenu.value == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
