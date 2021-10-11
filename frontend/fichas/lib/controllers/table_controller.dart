import 'package:fichas/models/ficha.dart';
import 'package:get/get.dart';

class TableController extends GetxController {
  var selected = false.obs;
  var fichaAtual = Ficha();

  void selectedFicha(Ficha ficha) {
    selected.value = true;
    fichaAtual = ficha;
  }
}
