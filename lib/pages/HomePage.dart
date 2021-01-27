import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/widgets/CustomBottomSheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_app/widgets/ProjectCard.dart';

import '../provider/GlobalProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    var theme = Theme.of(context);
    Responsive _responsive = Responsive(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("create");
          },
          child: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          tooltip: "Crear proyecto",
          backgroundColor: theme.primaryColor,
          splashColor: theme.accentColor,
        ),
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(
                height: _responsive.height * .02,
              ),
              Text(
                "Tus proyectos",
                style: theme.textTheme.headline3,
              ),
            ],
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: _responsive.height * .83,
          padding: EdgeInsets.only(top: _responsive.height * .025),
          child: new ListView.builder(
            shrinkWrap: true,
            itemCount: globalProvider.data.projects == null
                ? 0
                : globalProvider.data.projects.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectCard(
                project: globalProvider.data.projects[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
