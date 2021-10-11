import 'dart:convert';

import 'package:fichas/models/ficha.dart';
import 'package:fichas/services/base_connect.dart';
//import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FichasConnect extends BaseConnect {
  final uri = 'https://fichas.herokuapp.com/api';
  //Index
  Future<Response> index(int beg, int end) async {
    //print("alooooooooooooooo" + beg.toString() + end.toString());
    var url = "$uri/fichas?start=$beg&limit=$end";
    http.Response response = await http.get(Uri.parse(url));
    //print("HTTP É O META, PORRA " + response.body);
    //final response = await get('/fichas?start=$beg&limit=$end');
    //print("One Pieeeeeeeeeeece" + response.body);
    return response;
  }

  Future<Response> create(Ficha ficha) async {
    var url = "$uri/fichas";
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ficha.toJson()),
    );

    return response;
  }

  Future<Response> edit(Ficha ficha) async {
    final http.Response response = await http.put(
      Uri.parse(ficha.id!),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ficha.toJson()),
    );
    print("ediiiiiiiiiiiiiiiiiiite carai" + response.body);
    return response;
  }

  Future<Response> remove(Ficha ficha) async {
    final http.Response response = await http.delete(
      Uri.parse(ficha.id!),
    );
    print("remooooooooooooova carai" + response.body);
    return response;
  }
}
