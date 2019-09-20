import 'package:flutter/material.dart';
import 'package:hatebu_flutter_clone/screens/home_screen.dart';
import 'package:hatebu_flutter_clone/theme/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(context),
      title: 'はてなブックマーク',
      home: HomeScreen(),
    );
  }
}
