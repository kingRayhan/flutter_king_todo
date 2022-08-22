import 'package:flutter/widgets.dart';

import 'screens/home_screen.dart';
import 'screens/project_screen.dart';

final Map<String, Widget Function(BuildContext)> app_routes = {
  '/': (context) => const HomeScreen(),
  '/project': (context) => const ProjectScreen(),
};
