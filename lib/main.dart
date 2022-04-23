import 'package:answeree_islington_frontend/core/Preferences.dart';
import 'package:answeree_islington_frontend/features/onboarding/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/base_page.dart';
import 'features/home/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Answeree Islington',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasePage(
        child: Preferences.getBool('intro_shown_key')
            ? const HomePage()
            : const OnboardingPage(),
      ),
    );
  }
}
