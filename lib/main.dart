import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:typing/screens/HomeScreen.dart';
import 'package:url_strategy/url_strategy.dart';

void main(){
  setPathUrlStrategy();
  runApp(const ProviderScope(child: TypingApp()));
}

class TypingApp extends StatelessWidget {
  const TypingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whools Typing',
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        scaffoldBackgroundColor: Color.fromARGB(255, 50, 52, 64),
        primaryColor: const Color(0xff282a36),
        brightness: Brightness.dark,
        elevatedButtonTheme:  ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff282a36),
            minimumSize:  const Size(20, 56),
            elevation: 0
          )
        ),
        
      ),
      home: HomeScreen(),
    );
  }
}