import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/pages/TaskPage.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/ProjectProvider.dart';
import 'package:task_app/widgets/TaskCard.dart';

import 'ChatPage.dart';

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
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    projectProvider.getInfo();
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: _responsive.height * .04,
        ),
        Text(
          projectProvider.project.name,
          style: theme.textTheme.headline5,
        ),
        Text(projectProvider.project.description),
        StreamBuilder(
            stream: projectProvider.tasks,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data.length < 1) {
                return Center(child: Text("Este proyecto no tiene tareas"));
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TaskCard(
                        project: projectProvider.project,
                        task: snapshot.data[index],
                      ));
            }),
        RaisedButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TaskPage(
                    project: projectProvider.project,
                  ),
                ));
            projectProvider.getInfo();
          },
          child: Text("Crear tarea"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(
                    projectModel: projectProvider.project,
                  ),
                ));
          },
          child: Text("Chat"),
        ),
      ]),
    );
  }
}
