import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musicbox/logic/services/assets/assets.gen.dart';
import 'package:musicbox/l10n/l10n.dart';
import 'package:musicbox/logic/services/theme/cubit/theme_cubit.dart';
import 'package:musicbox/logic/services/theme/theme.dart';
import 'package:musicbox/presentation/global/helpers/ui_helpers.dart';
import 'package:sizer/sizer.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<ThemeCubit, ThemeMode>(
        listener: (context, state) {},
        child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.transparent),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.images.startup.bg.svg(fit: BoxFit.cover),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: Column(
                      children: [
                        Assets.images.startup.musicBoxLogo.image(),
                        verticalSpace(2),
                        DefaultTextStyle(
                          style:
                              context.watch<ThemeCubit>().textTheme.headline2!,
                          child: AnimatedTextKit(
                              // repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    l10n.onboardingWelcomeMessage,
                                    speed: const Duration(milliseconds: 200)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      CircularMusicBoxButton(
                        padding: const EdgeInsets.only(left: 45),
                        textColor: MusicBoxAppColor.white,
                        backgroundColor: MusicBoxAppColor.facebookBlue,
                        borderColor: MusicBoxAppColor.facebookBlue,
                        text: l10n.facebookText,
                        icon: Assets.images.startup.facebookLetterLogo.image(),
                      ),
                      verticalSpace(2),
                      CircularMusicBoxButton(
                        backgroundColor: MusicBoxAppColor.white,
                        borderColor: MusicBoxAppColor.white,
                        textColor: MusicBoxAppColor.tuna,
                        text: l10n.googleText,
                        icon: Assets.images.startup.search.image(),
                      ),
                      verticalSpace(7),
                      CircularMusicBoxButton(
                        textColor: MusicBoxAppColor.white,
                        backgroundColor: Colors.transparent,
                        borderColor: MusicBoxAppColor.white,
                        text: l10n.signUpText,
                        icon: Assets.images.startup.email.image(),
                      ),
                      verticalSpace(2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.alreadyText,
                            style: context
                                .watch<ThemeCubit>()
                                .textTheme
                                .bodyText1!
                                .copyWith(color: MusicBoxAppColor.manatee),
                          ),
                          horizontalSpace(2),
                          Text(
                            l10n.loginText,
                            style: context
                                .watch<ThemeCubit>()
                                .textTheme
                                .bodyText1!
                                .copyWith(color: MusicBoxAppColor.white),
                          ),
                        ],
                      ),
                      verticalSpace(2),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}

class CircularMusicBoxButton extends StatelessWidget {
  const CircularMusicBoxButton({
    Key? key,
    this.text,
    this.icon,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.padding,
  }) : super(key: key);

  final String? text;
  final Widget? icon;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: responsiveHeight(6.5),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon!,
          // horizontalSpace(2),
          Padding(
            padding: padding ?? const EdgeInsets.only(left: 40),
            child: Text(
              text!,
              style: context
                  .watch<ThemeCubit>()
                  .textTheme
                  .bodyText1!
                  .copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
