import 'package:danim/view_models/app_bar_view_model.dart';
import 'package:danim/views/app_bar.dart';
import 'package:danim/views/home_feed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danim',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(viewModel: AppBarViewModel()),
      body: HomeFeed(),
    );
  }
}
