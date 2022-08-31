import 'package:flutter/widgets.dart';
import 'package:king_todo/screens/splash_screen.dart';

import 'screens/home_screen.dart';
import 'screens/project_screen.dart';
import 'screens/test_screen.dart';

final Map<String, Widget Function(BuildContext)> app_routes = {
  '/splash': (context) => const SplashScreen(),
  '/': (context) => HomeScreen(),
  '/project': (context) => const ProjectScreen(),
  '/test': (context) => TestScreen()
};
