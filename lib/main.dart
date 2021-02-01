import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_app/config/Theme.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'config/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalProvider(),
        )
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
// https://documenter.getpostman.com/view/12255406/TW6tMW31#4ab94bf7-fa90-4c42-9ec4-d5641d8a3671
