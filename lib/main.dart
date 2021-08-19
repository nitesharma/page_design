import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:screens/screens/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff745C97),
        accentColor: Color(0xcc745C97),
      ),
      home: LoginPage(),
    );
  }
}
