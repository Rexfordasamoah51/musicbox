// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:musicbox/l10n/l10n.dart';
import 'package:musicbox/logic/services/theme/cubit/theme_cubit.dart';
import 'package:musicbox/presentation/startup/onboarding/onboarding.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      
      builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          bloc: ThemeCubit(),
          builder: (context, state) {
            final update = context.watch<ThemeCubit>();
            return AnimatedThemeApp(
              title: 'Music Box',
              themeMode: update.state,
              animationDuration: const Duration(milliseconds: 500),
              animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
              theme: themeLight,
              darkTheme: themeDark,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: const Onboarding(),
            );
          },
        ),
      );
    });
  }
}
