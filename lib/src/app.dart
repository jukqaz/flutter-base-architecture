import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/core/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.nanumGothic().fontFamily,
        ),
      );
}
