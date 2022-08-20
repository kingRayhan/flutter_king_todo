import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants.dart';
import 'models/project.dart';
import 'screens/home_screen.dart';
import 'screens/project_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectAdapter());
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: kBackgroundColor,
            titleTextStyle: GoogleFonts.nunito(
              fontSize: 22,
              color: kTitleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/project': (context) => ProjectScreen(),
        });
  }
}
