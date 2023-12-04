import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login/view.dart';
import 'auth/register/view.dart';
import 'auth/splash/view.dart';
import 'chat_page/view.dart';
import 'firebase_options.dart';
import 'shared/logic/helper_method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff284461),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: Color(0xff284461),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const ChatPage(),
    );
  }
}
