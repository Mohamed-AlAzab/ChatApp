import 'package:chat_app/Pages/home.dart';
import 'package:chat_app/Pages/login.dart';
import 'package:chat_app/Pages/setting.dart';
import 'package:chat_app/Pages/signup.dart';
import 'package:chat_app/Pages/splashScreen.dart';
import 'package:chat_app/Services/auth/auth_gate.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/': (context) => const SplashScreen(child: AuthGate()),
        '/Login': (context) => const Login(),
        '/SignUp': (context) => const SignUp(),
        '/Home': (context) => Home(),
        '/Setting': (context) => const Setting(),
      },
    );
  }
}
