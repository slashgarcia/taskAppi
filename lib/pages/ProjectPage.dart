import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/ProjectProvider.dart';

class ProjectPage extends StatelessWidget {
  final Project projectModel;

  const ProjectPage({Key key, this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => ProjectProvider(
            id: projectModel.id, token: globalProvider.data.token.token),
        builder: (context, child) => BuildProject(),
      ),
    );
  }
}

class BuildProject extends StatelessWidget {
  const BuildProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var projectProvider = Provider.of<ProjectProvider>(context);
    projectProvider.getInfo();
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(child: Text("${projectProvider.project.name}")),
    );
  }
}