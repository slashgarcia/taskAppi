import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/pages/ProjectPage.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/JoinProject.dart';

class JoinProjectPage extends StatelessWidget {
  const JoinProjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Unete a un proyecto"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => JoinProvider(globalProvider.data.token),
        builder: (context, child) => _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<JoinProvider>(context);

    return Column(
      children: [
        Expanded(
            child: StreamBuilder(
          stream: provider.projects,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => _ProjectCard(
                project: snapshot.data[index],
              ),
            );
          },
        ))
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var globalProvider = Provider.of<GlobalProvider>(context);
    var provider = Provider.of<JoinProvider>(context);

    return Card(
        elevation: 5.0,
        margin: EdgeInsets.all(20.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProjectPage(
                  projectModel: project,
                ),
              ),
            );
          },
          title: Text(project.name, style: theme.textTheme.headline5),
          subtitle: Text(
            project.description,
            style: theme.textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.add_box,
              ),
              onPressed: () async {
                bool ok = await provider.joinToProject(project.id.toString());
                if (ok) {
                  final snackBar =
                      SnackBar(content: Text('Te uniste a este proyecto'));
                  Scaffold.of(context).showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                      content: Text(
                          'Ya te has unido a este proyecto, selecciona otro'));
                  Scaffold.of(context).showSnackBar(snackBar);
                }
                globalProvider.updateData();
              }),
        ));
  }
}
