import 'package:flutter/material.dart';

import '../../shared/repositorys/interfaces/api_interface.dart';

class LoginController {
  final ApiInterface apiRepository;

  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginController(this.apiRepository);

  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      //apiRepository.login();
      Navigator.pushNamed(context, '/home');
    }
  }
}
