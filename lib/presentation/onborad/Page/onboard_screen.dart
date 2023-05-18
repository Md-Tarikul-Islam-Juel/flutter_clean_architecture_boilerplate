import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/utils/text_theme_style_x.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/local_storage/storage_handler.dart';
import '../../../../domain/onboard/useCase/onboard_Data.dart';
import '../../../../utils/custom_style.dart';
import '../../../../utils/size_constant.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/k_buttons.dart';
import '../../MainNavBare/main_nav.dart';
import '../widget/onboard_content.dart';

class OnboardScreen extends HookConsumerWidget {
  static const route = '/onboard';

  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final pageController = PageController();

    final isLastPage = selectedIndex.value == onboardData.length - 1;

    void pageNavigate() {
      if (isLastPage) {
        ref.watch(hiveProvider).put(KStrings.onboardStorageKey, true);
        context.pushReplacement(MainNav.route);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    }

    skipNavigate() {
      ref.watch(hiveProvider).put(KStrings.onboardStorageKey, true);
      context.pushReplacement(MainNav.route);
    }

    AnimatedContainer buildDot({int? index}) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        height: 1.h,
        width: selectedIndex.value == index ? 10.w : 5.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: index == selectedIndex.value
              ? useContext().color.primary
              : Colors.black.withOpacity(0.5),
          border: Border.all(
            color: Colors.transparent,
            width: 1.w,
          ),
          borderRadius: radius10,
        ),
      );
    }

    dotWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardData.length,
          (index) => buildDot(index: index),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.color.onPrimary,
      body: Column(
        children: [
          gap6,
          isLastPage
              ? SizedBox(
                  child: Text(
                    "",
                    style: CustomStyle.customStyleInstance.onboardSkipStyle,
                  ),
                )
              : Row(
                  mainAxisAlignment: mainEnd,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          // PrefHelper.saveIntroStatus(isCompleted: true);
                          skipNavigate();
                        },
                        child: Text(
                          KStrings.skip,
                          style:
                              CustomStyle.customStyleInstance.onboardTitleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
          gap10,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: SizedBox(
              height: 50.h,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  selectedIndex.value = index;
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) {
                  return OnboardContent(
                    image: onboardData[index].image,
                    title: onboardData[index].title,
                    description: onboardData[index].description,
                  );
                },
              ),
            ),
          ),
          gap8,
          SizedBox(width: 100.w, child: dotWidget()),
          const Spacer(),
          KElevatedButton(
            onPressed: () {
              pageNavigate();
            },
            text: isLastPage ? KStrings.getStarted : KStrings.next,
          ),
          gap10,
        ],
      ),
    );
  }
}
