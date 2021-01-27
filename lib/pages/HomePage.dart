import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/GlobalProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Scaffold(
      body: Center(
        child: Text(globalProvider.user.id.toString()),
      ),
    );
  }
}
