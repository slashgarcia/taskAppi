import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/JoinProject.dart';

class JoinProjectPage extends StatelessWidget {
  const JoinProjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => JoinProvider(globalProvider.data.token),
          child: _Content()),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Join project"),
    );
  }
}
