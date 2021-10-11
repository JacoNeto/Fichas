import 'package:fichas/controllers/fichas_controller.dart';
import 'package:fichas/models/ficha.dart';
import 'package:fichas/utils/fix_keyboard.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarForm extends StatefulWidget {
  const CriarForm({Key? key}) : super(key: key);

  @override
  State<CriarForm> createState() => _CriarFormState();
}

class _CriarFormState extends State<CriarForm> {
  final _formKey = GlobalKey<FormState>();

  final FichaController fichaController = Get.put(FichaController());

  String nome = "";

  String cpf = "";

  String telefone = "";

  String endereco = "";

  String bairro = "";

  String comunidade = "";

  String obs = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
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
                        onChanged: (value) {
                          nome = value;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    // cpf and phone wrapper
                    Row(
                      children: [
                        // cpf
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
                                  labelText: 'cpf'),
                              onChanged: (value) {
                                cpf = value;
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
                              onChanged: (value) {
                                telefone = value;
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
                        onChanged: (value) {
                          endereco = value;
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
                              onChanged: (value) {
                                bairro = value;
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
                              onChanged: (value) {
                                comunidade = value;
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
                        onChanged: (value) {
                          obs = value;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() {
                          if (fichaController.createLoading.value) {
                            return const CircularProgressIndicator();
                          }
                          return ElevatedButton(
                              onPressed: () async {
                                var ficha = Ficha(
                                    nome: nome,
                                    cpf: cpf,
                                    telefone: telefone,
                                    endereco: endereco,
                                    comunidade: comunidade,
                                    bairro: bairro,
                                    obs: obs);
                                print("JHDJIFNJIDNFJKDBFJK" + nome);
                                if (_formKey.currentState!.validate()) {
                                  fichaController.createLoading.value = true;
                                  await fichaController.create(ficha);
                                  fichaController.createLoading.value = false;
                                  _formKey.currentState!.reset();
                                }
                              },
                              child: const Text("Cadastrar"));
                        }),
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
      ),
    );
  }
}
