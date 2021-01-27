import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/config/Theme.dart';
import 'package:task_app/widgets/Button.dart';
import 'package:task_app/widgets/OptionIconLeft.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Responsive _responsive = Responsive(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 244, 253, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElasticIn(
                  delay: Duration(milliseconds: 1700),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: _responsive.width * .15,
                  ),
                ),
                SizedBox(
                  width: _responsive.width * .05,
                ),
                FadeIn(
                    delay: Duration(milliseconds: 1000),
                    child: Text("TaskApp", style: theme.textTheme.headline4)),
              ],
            ),
            SizedBox(
              height: _responsive.height * .09,
            ),
            JelloIn(
              delay: Duration(milliseconds: 2800),
              child: Text(
                "Maneja tus tareas facilmente",
                style: theme.textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: _responsive.height * .02,
            ),
            JelloIn(
              delay: Duration(milliseconds: 2800),
              child: Text(
                "Todas tus tareas al alcance de tu mano",
                style: theme.textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: _responsive.height * .2,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 4200),
              child: OptionIconLeft(
                  responsive: _responsive,
                  title: "Iniciar sesión",
                  theme: theme,
                  function: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  icon: Icons.arrow_forward),
            ),
            SizedBox(
              height: _responsive.height * .02,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 4400),
              child: OptionIconLeft(
                responsive: _responsive,
                title: "Registrarse",
                theme: theme,
                function: () {
                  Navigator.of(context).pushNamed("signUp");
                },
                icon: Icons.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }
}
