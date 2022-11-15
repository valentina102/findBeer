import 'package:find_beer/core/widgets/Dialog_log_out.dart';
import 'package:find_beer/features/bottom_navigation/presentation/pages/bottom_navigation.dart';
import 'package:find_beer/features/profile/presentation/pages/profile.dart';

import '../animations/fade_page_route.dart';
import '../../features/login/presentation/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';

enum Routes { LOGIN, BOTTOMNAVIGATION, DIALOGLOGOUT }

class _Page {
  static const String login = '/login';
  static const String bottom_navigation = '/bottom_navigation';
  static const String dialog_log_out = '/dialog_log_out';

  static const Map<Routes, String> _pageMap = {
    Routes.LOGIN: login,
    Routes.BOTTOMNAVIGATION: bottom_navigation,
    Routes.DIALOGLOGOUT: dialog_log_out,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    late int indexBottom;
    final argumentBottom = settings.arguments;
    if (argumentBottom is int) {
      indexBottom = argumentBottom;
    }
    switch (settings.name) {
      case _Page.login:
        return _pageRoute(
          page: LoginPage(),
          routeSettings: settings,
        );
      case _Page.bottom_navigation:
        return _pageRoute(
          page: BottomNavigationPage(
            index: indexBottom,
          ),
          routeSettings: settings,
        );
      case _Page.dialog_log_out:
        return _pageRoute(
          page: const DialogLogOut(),
          routeSettings: settings,
        );
      default:
        return _pageRoute(
          page: const LoginPage(),
          routeSettings: settings,
        );
    }
  }

  static Route _pageRoute({
    required Widget page,
    Duration? transitionDuration,
    RouteSettings? routeSettings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute<Route>(
            builder: (context) => page, settings: routeSettings)
        : FadeRoute(
            page: page,
            transitionDuration: transitionDuration,
            settings: routeSettings) as Route;
  }

  static Future push(Routes route, {Object? arguments}) => state.pushNamed(
        _Page.page(route)!,
        arguments: arguments,
      );

  static Future pushNamedAndRemoveUntil(Routes route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static void pop({Object? params}) => state.pop(params);
  static void popUntil(
    Routes route,
  ) {
    state.popUntil((Route<dynamic> routes) {
      print(routes.settings.name);
      return routes.settings.name == _Page.page(route)!;
    });
  }
}
