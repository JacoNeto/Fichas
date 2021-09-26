import 'package:fichas/utils/fix_keyboard.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CriarForm extends StatelessWidget {
  CriarForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String nome = "";
  String email = "";
  String telefone = "";
  String endereco = "";
  String bairro = "";
  String comunidade = "";
  String obs = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // name field
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o nome da pessoa';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Nome *',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true),
                      onSaved: (value) {
                        nome = value ?? "";
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  // email and phone wrapper
                  Row(
                    children: [
                      // email
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'email'),
                            onSaved: (value) {
                              email = value ?? "";
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      // Phone
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Telefone'),
                            onSaved: (value) {
                              telefone = value ?? "";
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Endereco
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Endereço'),
                      onSaved: (value) {
                        endereco = value ?? "";
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  // Bairro and comunidade wrapper
                  Row(
                    children: [
                      // Bairro
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Bairro'),
                            onSaved: (value) {
                              bairro = value ?? "";
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      // Comunidade
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Comunidade'),
                            onSaved: (value) {
                              comunidade = value ?? "";
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Observação *'),
                      onSaved: (value) {
                        obs = value ?? "";
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Cadastrar")),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: const Card(
                              child: Icon(
                                Icons.camera,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Enviar",
                            style: TextStyle(color: colorC1),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
