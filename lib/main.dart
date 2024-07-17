// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motiv_prototype/Testing/TestingHubs/component_testing_hub.dart';
import 'ComponentLibrary/Buttons/rerouting_button.dart';
import 'ComponentLibrary/WidgetScreens/snack_bar_widget.dart';
import 'Testing/TestingHubs/service_testing_hub.dart';
import 'colours.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY']!,
        appId: dotenv.env['APP_ID']!,
        messagingSenderId: dotenv.env['MESSAGE_SENDER_ID']!,
        projectId: dotenv.env['PROJECT_ID']!,
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motiv Party',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColours.primaryColor,
        primaryColorDark: const Color.fromARGB(12, 0, 150, 167),
        scaffoldBackgroundColor: AppColours.backgroundColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColours.buttonColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColours.onBackgroundColor),
          bodyMedium: TextStyle(color: AppColours.onBackgroundColor),
          bodySmall: TextStyle(color: AppColours.onBackgroundColor),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColours.primaryColor,
          secondary: AppColours.secondaryColor,
          surface: AppColours.surfaceColor,
          background: AppColours.backgroundColor,
          error: AppColours.errorColor,
          onPrimary: AppColours.onPrimaryColor,
          onSecondary: AppColours.onSecondaryColor,
          onSurface: AppColours.onSurfaceColor,
          onBackground: AppColours.onBackgroundColor,
          onError: AppColours.onErrorColor,
        )
            .copyWith(background: AppColours.backgroundColor)
            .copyWith(error: AppColours.errorColor),
      ),
      scaffoldMessengerKey: SnackbarPopUp.messengerKey,
      home: const MyHomePage(),
      routes: {
        '/componentTestingHub': (context) => const ComponentTestingHubPage(),
        '/serviceTestingHub': (context) => const ServiceTestingHubPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReroutingButton(
              onPressed: () {
                Navigator.pushNamed(context, '/componentTestingHub');
              },
              buttonText: 'Component Testing Hub',
            ),
            const SizedBox(height: 20), // Spacing between buttons
            ReroutingButton(
              onPressed: () {
                Navigator.pushNamed(context, '/serviceTestingHub');
              },
              buttonText: 'Service Testing Hub',
            ),
          ],
        ),
      ),
    );
  }
}
