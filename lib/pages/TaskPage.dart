import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/provider/CreateTaskProvider.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/widgets/InputText.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key key, this.project}) : super(key: key);
  final Project project;
  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return ChangeNotifierProvider(
        create: (context) =>
            CreateTaskProvider(globalProvider.data.token, project),
        builder: (context, _) => BuildTaskPage(),
        child: BuildTaskPage());
  }
}

class BuildTaskPage extends StatelessWidget {
  const BuildTaskPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    var globalProvider = Provider.of<GlobalProvider>(context);
    var provider = Provider.of<CreateTaskProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: Form(
              key: provider.formKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: _responsive.height * .2,
                      ),
                      Text(
                        "Crea un nuevo tarea",
                        style: theme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: _responsive.height * .1,
                      ),
                      InputText(
                        title: "Nombre del tarea",
                        stream: provider.name,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        sizeWidth: _responsive.width * .9,
                        validator: provider.isRequired,
                      ),
                      InputText(
                        title: "Descripción del tarea",
                        stream: provider.description,
                        validator: provider.isRequired,
                        padding: EdgeInsets.only(bottom: 10),
                        sizeWidth: _responsive.width * .9,
                      ),
                      SizedBox(
                        height: _responsive.height * .05,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 80.0, right: 80.0, bottom: 60.0),
                        child: RaisedButton(
                          child: Text(
                            "Crear tarea",
                            style: theme.textTheme.button,
                          ),
                          color: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () async {
                            if (provider.formKey.currentState.validate()) {
                              bool created = await provider.createTask(
                                provider.name.value,
                                provider.description.value,
                              );
                              if (created) {
                                final snackBar =
                                    SnackBar(content: Text('Tarea creada'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              } else {
                                final snackBar =
                                    SnackBar(content: Text('Hubo un error...'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              }
                              globalProvider.updateData();
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
