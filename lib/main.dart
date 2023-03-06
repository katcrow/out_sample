import 'package:clean_tutorial1/mock/sample/presentation/view/sample_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mock/sample/di/sample_provider_setup.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleScreen(),
    );
  }
}
