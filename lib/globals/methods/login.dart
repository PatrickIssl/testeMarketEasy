import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testemarketeasy/globals/globals.dart';
import 'package:testemarketeasy/globals/methods/produtos.dart';

class Login {
  static Future<String> logar(login, senha) async {
    var corpo = json.encode({"usuario": login, "senha": senha});

    http.Response response = await http.post(urlPostLogin,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);
    var dadosjson = json.decode(response.body);
    var status = dadosjson['response']["status"];
    if(response.statusCode == 200){
      if(status == "ok"){
        token = dadosjson['response']['token'].toString();
        tokenExpiration = dadosjson['response']['tokenExpiration'];
        return "sucesso";
      }else{
        return "Usuario ou senha incorretos";
      }
    }else{
      return "Erro na requisição de login";
    }

  }
}