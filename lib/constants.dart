import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackgroundColor = Color(0xFF191919);
const kAccentColor = Color(0xFFB0CC40);
const kCardBackgroundColor = Color(0xFF2B2B2B);
const kTitleColor = Color(0xFFC9C9C9);

const kProjectsDbName = 'projects__';

// source: https://stackoverflow.com/a/51119796/3705299
class ListViewScrollBehaviourNoGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
