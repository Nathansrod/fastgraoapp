import 'package:fastgrao_hackagrao2022/views/storage_list.dart';
import 'package:fastgrao_hackagrao2022/views/user_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserLogin(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 140, 198, 63),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 140, 198, 63),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 103, 93, 80),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.grey,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 24.0, letterSpacing: 0),
          headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 0.15),
          bodyText2: TextStyle(fontSize: 14.0, letterSpacing: 0.25),
          button: TextStyle(fontSize: 16.0, letterSpacing: 1.25),
          caption: TextStyle(fontSize: 12.0, letterSpacing: 0.4)
        ),
      ),
    );
  }
}

