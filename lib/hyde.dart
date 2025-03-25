import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



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
