import 'package:flutter/material.dart';
import 'package:task_app/config/responsive.dart';

class Button extends StatelessWidget {
  const Button(this.title, this.onTap, {this.width});
  final String title;
  final Function onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    return Container(
        width: width == null ? (_responsive.width * .7) : width,
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: _responsive.height * .02),
              child: Center(
                  child: Text(
                title,
                style: theme.textTheme.button,
              )),
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: theme.primaryColor.withOpacity(1),
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ));
  }
}
