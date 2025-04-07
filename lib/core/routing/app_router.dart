import 'package:flutter/material.dart';
import 'package:hyde_stylehub/core/error/no_routes.dart';
import 'package:hyde_stylehub/core/routing/routes.dart';
import 'package:hyde_stylehub/features/pages/main/ui/page/main_page.dart';
import 'package:hyde_stylehub/features/pages/onboarding_page/ui/page/onboarding_page.dart';

class AppRouter {


    static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static ColorScheme get theme {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw Exception("Navigator context is not available");
    }
    return Theme.of(context).colorScheme;
  }

  /// Returns a route based on [settings.name].
  ///
  ///
  /// If [settings.name] is not recognized, returns a route leading to [NoRoutes].
  Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case Routes.onBoarding:
        page = const OnboardingPage();
        break;
      case Routes.mainPage:
        page = const MainPage();
        break;
      default:
        page = const NoRoutes();
    }
    return _createPageRoute(page);
  }



/// Creates a [PageRouteBuilder] with custom animations for the given [page].
///
/// The transition includes a fade and slide effect, with the slide starting
/// from the right edge of the screen. The transition duration is set to
/// 200 milliseconds.

  PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, animation, __) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: page,
        ),
      ),
    );
  }
}