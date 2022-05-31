import 'package:flutter/material.dart';

import '../../shared/repositorys/api_repository.dart';
import '../../shared/services/service_web_request_http.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController(
    ApiRepository(
      ServiceWebHttp(),
    ),
  );

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginController.formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 400, right: 400),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // autofocus: true;
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
                controller: _loginController.textEditingControllerEmail,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length < 8) {
                      return 'Please at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                  controller: _loginController.textEditingControllerPassword,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () => _loginController.login(context),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('Logar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('Cadastre-se'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
