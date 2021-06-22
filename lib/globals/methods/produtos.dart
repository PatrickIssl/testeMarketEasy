import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testemarketeasy/globals/globals.dart';

class Produtos {
  static recuperarProdutos() async {
    http.Response response = await http.get(urlGetProduto,
        headers: {"token": "${token}"});
    var dadosjson = json.decode(response.body);
  }
}
