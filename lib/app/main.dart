import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/dependency/provider_setup.dart';
import 'home/presentation/view/home_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
