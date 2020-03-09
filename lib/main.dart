import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/body/counter/counter.dart';
import 'app/body/groups/model/group_info.dart';
import 'app/together_app_home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => Counter()),
        ChangeNotifierProvider(builder: (context) => GroupInfo()),
      ],
      child: TogetherApp(),
    ),
  );
}

class TogetherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.deepOrange[400],
      ),
      home: TogetherAppHome(),
    );
  }
}




