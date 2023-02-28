import 'package:flutter/material.dart';

import 'package:ipet_mobile/app/screens.dart';

import 'package:ipet_mobile/models/models.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'signup',
      name: 'Sign up',
      screen: const SignupScreen(),
    ),
    MenuOption(
        route: 'home',
        name: 'Home',
        screen: HomeScreen(
          appBar: AppBar(
            title: const Text("Home"),
          ),
        ),
        icon: Icons.home),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen(appBar: AppBar(title: const Text("Login"))));
}
