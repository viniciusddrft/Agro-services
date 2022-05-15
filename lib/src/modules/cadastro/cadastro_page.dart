import 'package:agro_services/src/shared/repositorys/api_repository.dart';
import 'package:agro_services/src/shared/services/service_web_request_http.dart';
import 'package:flutter/material.dart';

import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final CadastroController _cadastroController = CadastroController(
    ApiRepository(
      ServiceWebHttp(),
    ),
  );

  @override
  void dispose() {
    _cadastroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Form(
          key: _cadastroController.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerName,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerLastName,
                        decoration: const InputDecoration(
                          labelText: 'Sobrenome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerCpf,
                        decoration: const InputDecoration(
                          labelText: 'Cpf',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerPhone,
                        decoration: const InputDecoration(
                          labelText: 'Tel',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        try {
                          DateTime.parse(value);
                        } catch (e) {
                          debugPrint('erro');
                        }
                        return null;
                      }
                    },
                    controller:
                        _cadastroController.textEditingControllerdateOfBirth,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Data de nascimento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    controller:
                        _cadastroController.textEditingControllerAddress,
                    decoration: const InputDecoration(
                      labelText: 'Endereço',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length < 8) {
                            return 'Please at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerPassword1,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length < 8) {
                            return 'Please at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            _cadastroController.textEditingControllerPassword2,
                        decoration: const InputDecoration(
                          labelText: 'Confirme a senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () => _cadastroController.cadastro(context),
                    child: const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text('Criar conta'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
