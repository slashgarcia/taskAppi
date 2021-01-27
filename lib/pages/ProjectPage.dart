import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/models/ProjectModel.dart';
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
    projectProvider.getInfo();
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(projectProvider.project.name),
      ),
      body: Column(children: [
<<<<<<< HEAD
        SizedBox(
          height: _responsive.height * .05,
        ),
        Text(projectProvider.project.name, style: theme.textTheme.headline4),
        SizedBox(
          height: _responsive.height * .02,
        ),
        Text(projectProvider.project.description,
            style: theme.textTheme.subtitle1),
        SizedBox(
          height: _responsive.height * .03,
        ),
        projectProvider.tasks == null
            ? Text("Crea una tarea", style: theme.textTheme.headline1)
            : ListView.builder(
                itemCount: projectProvider.tasks == null
                    ? 0
                    : projectProvider.tasks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => TaskCard(
                      project: projectProvider.project,
                      task: projectProvider.tasks[index],
                    ))
=======
        Text(""),
        Text(""),
        StreamBuilder(
            stream: projectProvider.tasks,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
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
        )
>>>>>>> 0c4a217ac9f1da94c0014bb3a63398a79c858466
      ]),
    );
  }
}
