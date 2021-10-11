import 'package:get/get.dart';
//import 'package:get/get_connect/http/src/request/request.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    Get.log('Base Connect Inicializado');

    //URL base
    httpClient.baseUrl = 'https://fichas.herokuapp.com/api';

    // Json Content Type
    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = const Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 2;
  }
}
