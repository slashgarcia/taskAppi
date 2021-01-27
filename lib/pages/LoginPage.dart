import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/provider/GlobalProvider.dart';
import 'package:task_app/provider/LoginProvider.dart';
import 'package:task_app/widgets/InputText.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, _) => BuildLogin(),
      child: BuildLogin(),
    );
  }
}

class BuildLogin extends StatelessWidget {
  const BuildLogin({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var loginProvider = Provider.of<LoginProvider>(context);
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 244, 253, 1),
        body: Form(
          key: loginProvider.formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: _responsive.height * .2,
                  ),
                  Text(
                    "Ingresa tus credenciales",
                    style: theme.textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: _responsive.height * .1,
                  ),
                  InputText(
                    title: "Nombre de usuario",
                    stream: loginProvider.username,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    sizeWidth: _responsive.width * .9,
                    validator: loginProvider.isRequired,
                  ),
                  InputText(
                    title: "Contraseña",
                    stream: loginProvider.password,
                    validator: loginProvider.isValidPassword,
                    padding: EdgeInsets.only(bottom: 10),
                    sizeWidth: _responsive.width * .9,
                    obscureText: loginProvider.showPassword,
                    icon: IconButton(
                      icon: Icon(loginProvider.showPassword
                          ? Icons.lock
                          : Icons.lock_open),
                      onPressed: () => loginProvider.showPassword =
                          !loginProvider.showPassword,
                    ),
                  ),
                  SizedBox(
                    height: _responsive.height * .05,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 80.0, right: 80.0, bottom: 60.0),
                    child: RaisedButton(
                      child: Text(
                        "Iniciar sesión",
                        style: theme.textTheme.button,
                      ),
                      color: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        if (loginProvider.formKey.currentState.validate()) {
                          Uri uri = new Uri(
                            scheme: "https",
                            host: "api-task-ing.herokuapp.com",
                            pathSegments: ["api", "user", "login"],
                          );
                          final request = await http.post(uri, body: {
                            "username": "${loginProvider.username.value}",
                            "password": "${loginProvider.password.value}"
                          });

                          print(request.statusCode);
                          if (request.statusCode == 200) {
                            Navigator.of(context).pushNamed("");
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
          ),
        ),
      ),
    );
  }
}
