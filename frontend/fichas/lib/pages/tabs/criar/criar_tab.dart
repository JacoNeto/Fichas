import 'dart:io';
import 'dart:typed_data';

import 'package:fichas/controllers/fichas_controller.dart';
import 'package:fichas/models/ficha.dart';
import 'package:fichas/utils/fix_keyboard.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:path/path.dart';

class CriarForm extends StatefulWidget {
  const CriarForm({Key? key}) : super(key: key);

  @override
  State<CriarForm> createState() => _CriarFormState();
}

class _CriarFormState extends State<CriarForm> {
  final _formKey = GlobalKey<FormState>();

  final FichaController fichaController = Get.put(FichaController());

  String nome = "";

  String email = "";

  String telefone = "";

  String endereco = "";

  String bairro = "";

  String comunidade = "";

  String obs = "";

  String? _filepath;
  String? _fileName = "";
  Uint8List? _file;

  Future _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _file = result.files.first.bytes!;
        _fileName = result.files.first.name;
      });
    } else {
      // User canceled the picker
    }
  }

  //send image to firebase
  Future _uploadFileToFirebase(BuildContext context, Uint8List newFile) async {
    Uint8List file = newFile;

    try {
      firebase_storage.Reference reference =
          firebase_storage.FirebaseStorage.instance.ref('uploads/$_fileName');

      // makes upload
      await reference.putData(file);

      // get uploaded object link
      _filepath = await reference.getDownloadURL();
      print(_filepath);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      Get.showSnackbar(
        GetBar(
          title: "Erro",
          message: "Não foi possível fazer o upload",
          isDismissible: true,
        ),
      );
    }
  }

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
                                  labelText: 'email'),
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
                                    cpf: email,
                                    telefone: telefone,
                                    endereco: endereco,
                                    comunidade: comunidade,
                                    bairro: bairro,
                                    obs: obs,
                                    urlLink: _filepath);
                                print("JHDJIFNJIDNFJKDBFJK" + nome);
                                if (_formKey.currentState!.validate()) {
                                  if (_file == null) {
                                    fichaController.createLoading.value = true;
                                    await fichaController.create(ficha);
                                    fichaController.createLoading.value = false;
                                    _formKey.currentState!.reset();
                                  } else {
                                    try {
                                      fichaController.createLoading.value =
                                          true;
                                      await _uploadFileToFirebase(
                                          context, _file!);
                                      ficha.urlLink = _filepath;
                                      await fichaController.create(ficha);
                                      fichaController.createLoading.value =
                                          false;
                                      setState(() {
                                        _file = null;
                                      });
                                      _formKey.currentState!.reset();
                                    } on Exception catch (e) {
                                      print(e);
                                      Get.showSnackbar(
                                        GetBar(
                                          title: "Erro",
                                          message:
                                              "Não foi possível enviar o arquivo",
                                          isDismissible: true,
                                        ),
                                      );
                                    }
                                  }
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
                              child: Card(
                                child: _file == null
                                    ? const Icon(
                                        Icons.file_upload,
                                        size: 50,
                                        color: Colors.grey,
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.file_present,
                                            size: 50,
                                            color: Colors.green,
                                          ),
                                          Text(_fileName ?? "")
                                        ],
                                      ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _pickFile();
                            },
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
