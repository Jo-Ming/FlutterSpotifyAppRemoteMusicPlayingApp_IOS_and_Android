import 'package:flutter/material.dart';
import 'colours.dart';

void main() {
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
        primaryColorDark: AppColours.primaryVariant,
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
      home: const MyHomePage(),
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
      body: const Center(
        child: Text('Hello, World!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
