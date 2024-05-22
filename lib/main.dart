import 'package:flutter/material.dart';
import 'package:flutter_movie/global_keys.dart';
import 'package:flutter_movie/providers/common.dart';
import 'package:flutter_movie/screens/home.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: MaterialApp(
        navigatorKey: GlobalKeys.navigatorKey,
        title: 'Movie App',
        home: HomePage(),
      ),
    );
  }
}
