import 'package:fichas/controllers/fichas_controller.dart';
import 'package:fichas/controllers/table_controller.dart';
import 'package:fichas/models/ficha.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TableItem extends StatefulWidget {
  const TableItem({Key? key, required this.ficha}) : super(key: key);

  final Ficha ficha;

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  final _formKey = GlobalKey<FormState>();

  final TableController tableController = Get.find();

  final FichaController fichaController = Get.put(FichaController());

  void _unselect() {
    tableController.selected.value = false;
  }

  @override
  Widget build(BuildContext context) {
    String nome = widget.ficha.nome ?? "";
    String email = widget.ficha.cpf ?? "";
    String telefone = widget.ficha.telefone ?? "";
    String endereco = widget.ficha.endereco ?? "";
    String bairro = widget.ficha.bairro ?? "";
    String comunidade = widget.ficha.comunidade ?? "";
    String obs = widget.ficha.obs ?? "";

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
                      initialValue: nome,
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
                            initialValue: email,
                            validator: (value) {
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Email'),
                            onChanged: (value) {
                              email = value;
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
                            initialValue: telefone,
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
                      initialValue: endereco,
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
                            initialValue: bairro,
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
                            initialValue: comunidade,
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
                      initialValue: obs,
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
                        if (fichaController.removeLoading.value ||
                            fichaController.updateLoading.value) {
                          return const CircularProgressIndicator();
                        }
                        return Row(
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    fichaController.removeLoading.value = true;
                                    await fichaController.remove(widget.ficha);
                                    fichaController.removeLoading.value = false;
                                    _formKey.currentState!.reset();
                                  }
                                  _unselect();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.delete),
                                    Text("Remover"),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      var novaficha = Ficha(
                                          id: widget.ficha.id!,
                                          nome: nome,
                                          cpf: email,
                                          telefone: telefone,
                                          endereco: endereco,
                                          comunidade: comunidade,
                                          bairro: bairro,
                                          createdDate:
                                              widget.ficha.createdDate!,
                                          obs: obs);
                                      fichaController.updateLoading.value =
                                          true;
                                      await fichaController.edit(novaficha);
                                      fichaController.updateLoading.value =
                                          false;
                                      _formKey.currentState!.reset();
                                    }
                                    _unselect();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow[900],
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit),
                                      Text("Editar"),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextButton(
                                  onPressed: () {
                                    _unselect();
                                  },
                                  child: const Text("Cancelar")),
                            )
                          ],
                        );
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
                                Icons.download,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: widget.ficha.urlLink == null
                              ? null
                              : () {
                                  _launchURL(widget.ficha.urlLink);
                                },
                          child: const Text(
                            "Baixar",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
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

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
