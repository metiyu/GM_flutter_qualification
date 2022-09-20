import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif/pages/foods-page.dart';
import 'package:qualif/pages/sign-in-page.dart';
import 'package:qualif/provider/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeProvider(isLight: true)),
      child: const Qualif(),
    ),
  );
}

class Qualif extends StatefulWidget {
  const Qualif({super.key});

  @override
  State<Qualif> createState() => _QualifState();
}

class _QualifState extends State<Qualif> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'McDonald',
          home: const SignIn(),
          theme: themeProvider.getTheme,
        );
      },
    );
  }
}
