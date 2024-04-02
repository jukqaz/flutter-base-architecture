import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        onPressed: onPressed,
        icon: const FaIcon(FontAwesomeIcons.accusoft),
        label: const Text('Sign Up'),
      );
}
