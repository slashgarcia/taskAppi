import 'package:flutter/material.dart';
import 'package:task_app/config/Responsive.dart';

class OptionIconLeft extends StatelessWidget {
  const OptionIconLeft({
    Key key,
    @required Responsive responsive,
    @required this.title,
    @required this.theme,
    @required this.function,
    @required this.icon,
  })  : _responsive = responsive,
        super(key: key);

  final Responsive _responsive;
  final String title;
  final ThemeData theme;
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _responsive.width * .8,
      height: _responsive.height * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyText2,
          ),
          SizedBox(
            width: _responsive.width * .2,
          ),
          GestureDetector(
            onTap: function,
            child: Container(
              width: _responsive.width * .1,
              height: _responsive.height * .05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromRGBO(240, 244, 253, 1)),
              child: Icon(icon, color: Color.fromRGBO(105, 154, 250, 1)),
            ),
          )
        ],
      ),
    );
  }
}
