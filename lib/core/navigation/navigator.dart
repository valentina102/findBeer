import 'package:find_beer/core/animations/fade_page_route.dart';
import 'package:find_beer/features/login/presentation/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';

enum Routes {
  LOGIN
}

class _Page {
  static const String login = '/login';

  static const Map<Routes, String> _pageMap = {
    Routes.LOGIN: login,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final argument = settings.arguments;


    switch (settings.name) {
      case _Page.login:
        return _pageRoute(
          page:  const LoginPage(),
          settings: settings,
        );
      default:
        return _pageRoute(
          page:  const LoginPage(),
          settings: settings,
        );
    }
  }

  static Route _pageRoute({
    required Widget page,
    Duration? transitionDuration,
    RouteSettings? settings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute<Route>(
            builder: (context) => page,
            settings: settings,
          )
        : FadeRoute(
            page: page,
            transitionDuration: transitionDuration,
            routeSettings: settings,
          ) as Route;
  }

  static Future push<T>(Routes route, {Object? arguments}) => state.pushNamed(
        _Page.page(route)!,
        arguments: arguments,
      );

  static Future pushNamedAndRemoveUntil<T>(Routes route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static void pop() => state.pop();

  static void popUntil(Routes route) => state.popUntil(
        (routes) => routes.settings.name == _Page.page(route)!,
      );
}
