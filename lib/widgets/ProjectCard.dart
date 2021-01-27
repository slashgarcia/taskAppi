import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/provider/GlobalProvider.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Card(
        elevation: 5.0,
        margin: EdgeInsets.all(20.0),
        child: ListTile(
          onTap: () {
            //TODO Push como parametro
          },
          title: Text(project.name, style: theme.textTheme.headline5),
          subtitle: Text(
            project.description,
            style: theme.textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
          trailing: IconButton(
            icon: Icon(
              FontAwesomeIcons.trash,
            ),
            onPressed: () => globalProvider.removeProject(project.id),
          ),
        ));
  }
}
