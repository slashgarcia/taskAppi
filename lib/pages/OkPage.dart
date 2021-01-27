import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/Responsive.dart';

class OkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 244, 253, 1),
        body: Container(
          width: _responsive.width,
          height: _responsive.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(
                child: Image.asset(
                  "assets/ok.png",
                  width: _responsive.width * .35,
                ),
              ),
              SizedBox(
                height: _responsive.height * .07,
              ),
              ElasticIn(
                // delay: Duration(milliseconds: 400),
                child: Text(
                  "¡Registro exitoso!",
                  style: theme.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: _responsive.height * .07,
              ),
              FadeInUp(
                delay: Duration(milliseconds: 800),
                child: Container(
                  width: _responsive.width * .4,
                  height: _responsive.height * .06,
                  child: RaisedButton(
                    elevation: 10.0,
                    child: Text(
                      "Iniciar sesión",
                      style: theme.textTheme.button,
                    ),
                    color: theme.primaryColor,
                    splashColor: theme.accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "login", (Route<dynamic> route) => false);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
