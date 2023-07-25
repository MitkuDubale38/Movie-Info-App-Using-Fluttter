import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/view/movies/screens/movies.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
