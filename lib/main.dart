import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:king_todo/models/project.dart';
import 'package:path_provider/path_provider.dart';

import 'constants.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    schemas: [ProjectSchema],
    directory: appDir.path,
  );
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
      initialRoute: '/splash',
      routes: app_routes,
    );
  }
}
