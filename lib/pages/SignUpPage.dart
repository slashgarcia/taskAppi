import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/Responsive.dart';
import 'package:task_app/provider/SignUpProvider.dart';
import 'package:task_app/widgets/InputText.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      builder: (context, child) => Consumer<SignUpProvider>(
        builder: (context, provider, _) => BuildSignUp(
          provider: provider,
        ),
      ),
    );
  }
}

class BuildSignUp extends StatelessWidget {
  final SignUpProvider provider;
  const BuildSignUp({Key key, this.provider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    var theme = Theme.of(context);
    double widthInputText = _responsive.width * .9;
    var provider = Provider.of<SignUpProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 244, 253, 1),
        body: Form(
          key: provider.formKey,
          child: ListView(
            children: [
              SizedBox(
                height: _responsive.height * .2,
              ),
              Text(
                "Regístrate",
                style: theme.textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: _responsive.height * .1,
              ),
              InputText(
                stream: provider.username,
                title: "Nombre de usuario",
                sizeWidth: widthInputText,
                validator: provider.isRequired,
              ),
              SizedBox(
                height: _responsive.height * .02,
              ),
              InputText(
                stream: provider.email,
                title: "Correo electrónico",
                sizeWidth: widthInputText,
                validator: provider.isValidEmail,
              ),
              SizedBox(
                height: _responsive.height * .02,
              ),
              InputText(
                title: "Contraseña",
                stream: provider.password,
                validator: provider.isValidPassword,
                padding: EdgeInsets.only(bottom: 10),
                sizeWidth: _responsive.width * .9,
                obscureText: provider.showPasswords,
                icon: IconButton(
                  icon: Icon(
                      provider.showPasswords ? Icons.lock : Icons.lock_open),
                  onPressed: () =>
                      provider.showPasswords = !provider.showPasswords,
                ),
              ),
              SizedBox(
                height: _responsive.height * .02,
              ),
              InputText(
                title: "Confirmar contraseña",
                stream: provider.confirmPassword,
                validator: provider.isValidConfirmPassword,
                padding: EdgeInsets.only(bottom: 10),
                sizeWidth: _responsive.width * .9,
                obscureText: provider.showPasswords,
                icon: IconButton(
                  icon: Icon(
                      provider.showPasswords ? Icons.lock : Icons.lock_open),
                  onPressed: () =>
                      provider.showPasswords = !provider.showPasswords,
                ),
              ),
              SizedBox(
                height: _responsive.height * .04,
              ),
              Container(
                padding: EdgeInsets.only(left: 80.0, right: 80.0, bottom: 60.0),
                child: RaisedButton(
                  child: Text(
                    "Registrarme",
                    style: theme.textTheme.button,
                  ),
                  color: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () async {
                    if (provider.formKey.currentState.validate()) {
                      Uri uri = new Uri(
                        scheme: "https",
                        host: "api-task-ing.herokuapp.com",
                        pathSegments: ["api", "user"],
                      );
                      final request = await http.post(uri, body: {
                        "email": "${provider.email.value}",
                        "username": "${provider.username.value}",
                        "password": "${provider.password.value}"
                      });

                      if (request.body.contains("already")) {
                        Navigator.of(context).pushNamed("error");
                      } else {
                        Navigator.of(context).pushNamed("ok");
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
