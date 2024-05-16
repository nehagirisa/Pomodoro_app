import 'package:flutter/material.dart';
import 'package:pomodoroapp/Pomodoro.dart';
import 'package:pomodoroapp/timeservice.dart';
import 'package:provider/provider.dart';


void main() => runApp(ChangeNotifierProvider<timerservice>(
      create: (_) => timerservice(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:pomodoroScreen()
    );
  }
}

