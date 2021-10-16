import 'dart:convert';

import 'package:fichas/models/ficha.dart';
import 'package:fichas/services/connect/fichas_connect.dart';
import 'package:fichas/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:fichas/models/page.dart' as data_page;

class FichaController extends GetxController {
  final FichasConnect _connect = Get.put(FichasConnect());

  var createLoading = false.obs;
  var updateLoading = false.obs;
  var removeLoading = false.obs;

  var pageData = data_page.Page();

  /// Fetch all Fichas from database
  Future<List<Ficha>> getAll(int page) async {
    List<Ficha> list = [];

    final http.Response response = await _connect.index(page);
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
      list = JsonUtils.fichaList(response);
      pageData = JsonUtils.getPage(response) ?? data_page.Page();
    } else {
      Get.log('Deu erro');
    }

    return list;
  }

  //Cria um novo objeto
  Future<void> create(Ficha ficha) async {
    try {
      final http.Response response = await _connect.create(ficha);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Sucesso!", "A operação foi concluída com êxito",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } on Exception catch (e) {
      print(e);
      Get.showSnackbar(
        GetBar(
          title: "Algo deu errado",
          message: "falha no cadastro",
          isDismissible: true,
        ),
      );
    }
  }

  //Atualiza um novo objeto
  Future<void> edit(Ficha ficha) async {
    try {
      final http.Response response = await _connect.edit(ficha);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Sucesso!", "A operação foi concluída com êxito",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } on Exception catch (e) {
      print(e);
      Get.showSnackbar(
        GetBar(
          title: "Algo deu errado",
          message: "falha na edição",
          isDismissible: true,
        ),
      );
    }
  }

  //Atualiza um novo objeto
  Future<void> remove(Ficha ficha) async {
    try {
      final http.Response response = await _connect.remove(ficha);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Sucesso!", "A operação foi concluída com êxito",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } on Exception catch (e) {
      print(e);
      Get.showSnackbar(
        GetBar(
          title: "Algo deu errado",
          message: "falha na edição",
          isDismissible: true,
        ),
      );
    }
  }

  //// TABLE
  ///
  ///

  var pageAtual = 0.obs;

  void previousPage() {
    if (pageAtual.value > 0) {
      print("valooooooor" + pageAtual.value.toString());
      pageAtual.value--;
    }
  }

  void nextPage() {
    if (pageAtual.value < (pageData.totalPages ?? 0) - 1) {
      print("valooooooor" + pageAtual.value.toString());
      pageAtual.value++;
    }
  }
}
