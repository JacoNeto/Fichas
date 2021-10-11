import 'dart:convert';

import 'package:fichas/models/ficha.dart';
import 'package:fichas/models/result_response/result_response.dart';
import 'package:http/http.dart';
//import 'package:get/get.dart';

class JsonUtils {
  static void prettyprint(Response response) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(response.body);
    print(prettyprint);
  }

  static void prettyprintSring(String text) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(text);
    print(prettyprint);
  }

  static Map<String, dynamic> getMap(Response response) {
    return json.decode(response.body.toString());
    //return json.decode(utf8.decode(response.bodyString!.runes.toList()));
  }

  static ResultResponse getResultResponse(Response response) {
    Map<String, dynamic> data = getMap(response);
    return ResultResponse.fromJson(data);
  }

  /// Recupera a lista de Fichas
  static List<Ficha> fichaList(Response response) {
    Map<String, dynamic> data = getMap(response);
    //print("testemap" + data.toString());
    //print("outroteste" + data['_embedded']['fichas'].toString());
    List<Ficha> list = (data['_embedded']['fichas'] as List<dynamic>)
        .map((e) => Ficha.fromJson(e))
        .toList();
    //List<Ficha> list = [];
    return list;
  }

  ///Recupera Pessoa específica
  /*static Person? getPerson(Response response) {
    Map<String, dynamic> data = getMap(response);
    Person? person = (data['_obj'] == null)
        ? null
        : Person.fromJson(data['_obj'] as Map<String, dynamic>);
    return person;
  }*/

}
