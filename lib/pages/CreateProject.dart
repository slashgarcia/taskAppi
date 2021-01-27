import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/provider/CreateProjectProvider.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/widgets/InputText.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CreateProjectProvider(),
        builder: (context, _) => BuildCreateProjectPage(),
        child: BuildCreateProjectPage());
  }
}

class BuildCreateProjectPage extends StatelessWidget {
  const BuildCreateProjectPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    var globalProvider = Provider.of<GlobalProvider>(context);
    var createProjectProvider = Provider.of<CreateProjectProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: Form(
              key: createProjectProvider.formKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: _responsive.height * .2,
                      ),
                      Text(
                        "Crea un nuevo proyecto",
                        style: theme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: _responsive.height * .1,
                      ),
                      InputText(
                        title: "Nombre del proyecto",
                        stream: createProjectProvider.name,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        sizeWidth: _responsive.width * .9,
                        validator: createProjectProvider.isRequired,
                      ),
                      InputText(
                        title: "Descripción del proyecto",
                        stream: createProjectProvider.description,
                        validator: createProjectProvider.isRequired,
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
                            "Crear proyecto",
                            style: theme.textTheme.button,
                          ),
                          color: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () async {
                            if (createProjectProvider.formKey.currentState
                                .validate()) {
                              bool created = await globalProvider.createProject(
                                createProjectProvider.name.value,
                                createProjectProvider.description.value,
                              );
                              if (created) {
                                Navigator.of(context).pushNamed("home");
                              } else {
                                Navigator.of(context).pushNamed("error");
                              }
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
