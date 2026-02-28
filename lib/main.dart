import 'package:flutter/material.dart';
import 'package:school/home_page.dart';
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
        '/admin': (context) => HomeMenuPage(
          name: ModalRoute.of(context)!.settings.arguments as String,
          role: 'admin',
        ),
        '/teacher4': (context) => HomeMenuPage(
          name: ModalRoute.of(context)!.settings.arguments as String,
          role: 'teacher_form4',
        ),
        '/teacher5': (context) => HomeMenuPage(
          name: ModalRoute.of(context)!.settings.arguments as String,
          role: 'teacher_form5',
        ),
        '/dashboard': (context) => const Placeholder(),
        '/update': (context) => const Placeholder(),
      },
    );
  }
}
