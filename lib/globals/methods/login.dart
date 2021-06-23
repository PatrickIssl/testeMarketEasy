import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testemarketeasy/globals/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Login {
  //classe que realiza o login
  static Future<String> logar(login, senha) async {

    // variavel para colocar o body na requisição
    var corpo = json.encode({"usuario": login, "senha": senha});

    http.Response response = await http.post(urlPostLogin,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);
    var dadosjson = json.decode(response.body);
    var status = dadosjson['response']["status"];

    //status for igual a ok ele segue
    if (response.statusCode == 200) {
      if (status == "ok") {
        token = dadosjson['response']['token'].toString();

        //transformando o formato da data retornada no json
        tokenExpiration = new DateFormat("dd-MM-yyyy hh:mm:ss").parse(
            dadosjson['response']['tokenExpiration'].replaceAll('/', '-'));

        try {
          //salvando o token e a data em que expira localmente
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", token);
          prefs.setString("tokenExpiration", tokenExpiration.toString());
        } catch (e) {
          print("e");
        }

        return "sucesso";
      } else {
        return "Usuario ou senha incorretos";
      }
    } else {
      return "Erro ao Carregar Requisição";
    }
  }
}
