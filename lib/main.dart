import 'package:flutter/material.dart';
import 'package:testemarketeasy/screens/listagemprodutos.dart';
import 'package:testemarketeasy/screens/telalogin.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'MarketEasy',
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    initialRoute: '/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/produtos': (context) => ListagemProdutos(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
