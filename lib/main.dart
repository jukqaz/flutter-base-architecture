import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/app.dart';
import 'package:flutter_base_architecture/src/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  talker.log(Platform.environment);

  runApp(
    const ProviderScope(child: MainApp()),
  );
}
