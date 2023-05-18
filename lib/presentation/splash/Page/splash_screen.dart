import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/local_storage/storage_handler.dart';
import '../../../../utils/asset_utils.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/strings.dart';
import '../../MainNavBare/main_nav.dart';
import '../../onborad/Page/onboard_screen.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  static const route = '/';
  static const splashPageDelayTime = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //when no value found in hive for (KStrings.onboardStorageKey) then  it will return by default false
    final isOnboardChecked = ref.watch(hiveProvider).get(
          KStrings.onboardStorageKey,
          defaultValue: false,
        );
    useEffect(() {
      Future.delayed(const Duration(seconds: splashPageDelayTime), () {
        isOnboardChecked
            ? context.pushReplacement(MainNav.route)
            : context.pushReplacement(OnboardScreen.route);
      });
      return null;
    }, []);

    return Scaffold(
      body: Container(
        color: CustomColor.PrimaryColor,
        child: SafeArea(
          top: true,
          minimum: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(AssetUtils.splashPageLogo),
            ],
          ),
        ),
      ),
    );
  }
}
