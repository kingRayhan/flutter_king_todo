import 'package:flutter/widgets.dart';
import 'package:king_todo/screens/splash_screen.dart';

import 'screens/projects_screen.dart';
import 'screens/todos_screen.dart';

// ignore: non_constant_identifier_names
final Map<String, Widget Function(BuildContext)> app_routes = {
  '/splash': (context) => const SplashScreen(),
  '/home': (context) => ProjectsScreen(),
  '/todos': (context) => const TodosScreen(),
};
