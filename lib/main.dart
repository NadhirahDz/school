import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Sekolah',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/admin': (context) => const Placeholder(), // will replace later
        '/teacher4': (context) => const Placeholder(), // will replace later
        '/teacher5': (context) => const Placeholder(), // will replace later
      },
    );
  }
}
