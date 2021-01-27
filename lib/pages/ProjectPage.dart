import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/ProjectProvider.dart';
import 'package:task_app/widgets/TaskCard.dart';

class ProjectPage extends StatelessWidget {
  final Project projectModel;

  const ProjectPage({Key key, this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => ProjectProvider(
            project: projectModel, token: globalProvider.data.token.token),
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
      body: Column(children: [
        Text(""),
        Text(""),
        projectProvider.tasks == null
            ? Text("Crea una tarea")
            : ListView.builder(
                itemCount: projectProvider.tasks == null
                    ? 0
                    : projectProvider.tasks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => TaskCard(
                      project: projectProvider.project,
                      task: projectProvider.tasks[index],
                    ))
      ]),
    );
  }
}
