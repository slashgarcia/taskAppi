import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_app/config/Responsive.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key key,
    @required Responsive responsive,
    @required this.theme,
    @required this.function,
    @required this.icon,
  })  : _responsive = responsive,
        super(key: key);

  final Responsive _responsive;
  final ThemeData theme;
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _responsive.height * .1,
      padding: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black45,
          //     offset: Offset(0.0, -1.0),
          //     blurRadius: 5.0,
          //   )
          // ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: theme.scaffoldBackgroundColor),
      child: Center(
        child: SpeedDial(
          overlayColor: theme.scaffoldBackgroundColor,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          marginRight: _responsive.width * .47,
          marginBottom: _responsive.height * .03,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
                child: Icon(FontAwesomeIcons.plus),
                backgroundColor: theme.scaffoldBackgroundColor,
                onTap: function,
                label: "Crear un proyecto",
                labelStyle: theme.textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
