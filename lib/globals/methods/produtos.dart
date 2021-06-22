import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testemarketeasy/globals/globals.dart';

class Produtos {
  static recuperarProdutos() async {
    http.Response response = await http.get(urlGetProduto,
        headers: {"token": "${token}"});
    var dadosjson = json.decode(response.body);

    var status = dadosjson['response']["status"];
    if(response.statusCode == 200){
      if(status == "ok"){
        var produtos = dadosjson['response']['produtos'].toString();
        return "sucesso";
      }
    }else if(response.statusCode == 203){
      return "deslogado";
    }else{
      return "Erro Ao Carregar Requisição";
    }



  }
}
