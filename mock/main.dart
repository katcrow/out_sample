import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sample/dependency/sample_provider_setup.dart';
import 'sample/presentation/view/sample_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: sampleGlobalProviders,
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
      home: const SampleScreen(),
    );
  }
}
