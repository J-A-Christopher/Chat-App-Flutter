import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Chat',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
                .copyWith(
                  secondary: Colors.deepPurple,
                )
                .copyWith(background: Colors.pink),
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        home: StreamBuilder(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const ChatScreen();
            }
            return const AuthScreen();
          }),
          stream: FirebaseAuth.instance.authStateChanges(),
        )

        //const AuthScreen()

        );
  }
}
