import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_app/config/Theme.dart';
import 'package:task_app/provider/LoginProvider.dart';
import 'package:task_app/provider/SignUpProvider.dart';
import 'config/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: MaterialApp(
          title: 'Tasks',
          onGenerateRoute: routes,
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          theme: principalTheme),
    );
  }
}
