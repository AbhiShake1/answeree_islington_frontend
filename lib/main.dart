import 'package:answeree_islington_frontend/core/preferences.dart' as preferences;
import 'package:answeree_islington_frontend/features/onboarding/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/home/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Answeree Islington',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: preferences.getBool('intro_shown_key')
            ? const HomePage()
            : const OnboardingPage(),
      );
}
