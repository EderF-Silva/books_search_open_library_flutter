import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => HomeScreen(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Library App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreenWidget(),
    );
  }
}
