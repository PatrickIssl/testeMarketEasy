import 'package:flutter/material.dart';
import 'package:testemarketeasy/globals/globals.dart';
import 'package:testemarketeasy/screens/listagemprodutos.dart';
import 'package:testemarketeasy/screens/telalogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

String data= "";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'MarketEasy',
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    initialRoute:  await recuperarToken() == true?'/produtos':'/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/produtos': (context) => ListagemProdutos(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

//recupera o token da memoria do celular
recuperarToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token")??"";
  data = prefs.getString("tokenExpiration")??"";
  //verifica se existe um token
  if(token != ""){
    //transforma a string data em um dateTime
    tokenExpiration = DateTime.parse(data);
    //verifica se o token ainda é valido
    if(tokenExpiration.isAfter(DateTime.now())){
      return true;
    }else{
      await SharedPreferences.getInstance();
      prefs.remove("token");
      prefs.remove("tokenExpiration");
    }
  }
  return false;
}
