import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/cubit/theme_cubit.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/cubit/theme_shared_preferences.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/cubit/theme_state.dart';
import 'package:hyde_stylehub/generated/l10n.dart';



class HyDEApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  HyDEApp(AppRouter appRouter, {super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        lazy: true,
        create:
            (context) => ThemeCubit(
              themeSharedPreferences: ThemeSharedPreferences(),
              context: context,
            )..initializeTheme(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: ' تَضَامُنٌ',
              theme: lightTheme,
              // darkTheme: darkTheme,
              themeMode: themeState.themeMode,
            initialRoute: Routes.onBoarding,
              onGenerateRoute: appRouter.generateRoute,
              locale: const Locale('en', 'UK'),
              supportedLocales: const [Locale('en', 'UK')],
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback:
                  (locale, supportedLocales) => const Locale('en', 'UK'),
            );
          },
        ),
      ),
    );
  }
}
