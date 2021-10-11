import 'package:fichas/models/ficha.dart';
import 'package:fichas/services/connect/fichas_connect.dart';
import 'package:fichas/utils/json_utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class FichaController extends GetxController {
  final FichasConnect _connect = Get.put(FichasConnect());

  var createLoading = false.obs;
  var updateLoading = false.obs;
  var removeLoading = false.obs;

  /// Fetch all Fichas from database
  Future<List<Ficha>> getAll(int beg, int end) async {
    List<Ficha> list = [];

    final http.Response response = await _connect.index(beg, end);
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
      list = JsonUtils.fichaList(response);
    } else {
      Get.log('Deu erro');
    }

    return list;
  }

  //Cria um novo objeto
  Future<void> create(Ficha ficha) async {
    try {
      final http.Response response = await _connect.create(ficha);
      print(response.body);
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
      print(response.body);
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
      print(response.body);
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
}
