import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/core/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        routerConfig: ref.watch(goRouterProvider),
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.nanumGothic().fontFamily,
        ),
      );
}
