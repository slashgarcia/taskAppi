import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/models/TaskModel.dart';
import 'package:task_app/provider/GlobalProvider.dart';

class TaskCard extends StatelessWidget {
  final Project project;
  final Task task;

  const TaskCard({Key key, this.project, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Card(
        elevation: 5.0,
        margin: EdgeInsets.all(20.0),
        child: ListTile(
          onTap: () {},
          title: Text(task.title, style: theme.textTheme.headline5),
          subtitle: Text(
            task.description,
            style: theme.textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
          trailing: IconButton(
            icon: Icon(FontAwesomeIcons.check,
                color: task.done ? Colors.green : Colors.grey),
            onPressed: () => globalProvider.changeToDone(task.id),
          ),
        ));
  }
}
