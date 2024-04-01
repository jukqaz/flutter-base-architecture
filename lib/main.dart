import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabaseUrl = Platform.environment['SUPABASE_URL'] ?? '';
  final supabaseAnonKey = Platform.environment['SUPABASE_ANON_KEY'] ?? '';

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(
    const ProviderScope(child: MainApp()),
  );
}
