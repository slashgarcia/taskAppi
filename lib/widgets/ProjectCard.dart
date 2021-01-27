import 'package:flutter/material.dart';
import 'package:task_app/config/Responsive.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key key,
    @required this.function,
    @required Responsive responsive,
    @required this.title,
    @required this.theme,
    @required this.description,
  })  : _responsive = responsive,
        super(key: key);

  final Function function;
  final Responsive _responsive;
  final String title;
  final ThemeData theme;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: new Card(
        elevation: 5.0,
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: _responsive.height * .02,
            ),
            Row(
              children: [
                SizedBox(
                  width: _responsive.width * .03,
                ),
                Text(title, style: theme.textTheme.headline5),
              ],
            ),
            SizedBox(
              height: _responsive.height * .01,
            ),
            Row(
              children: [
                SizedBox(
                  width: _responsive.width * .03,
                ),
                Text(
                  description,
                  style: theme.textTheme.bodyText2,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: _responsive.height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
