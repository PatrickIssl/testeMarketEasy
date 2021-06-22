import 'package:flutter/material.dart';
import 'package:testemarketeasy/globals/methods/login.dart';
import 'package:testemarketeasy/globals/methods/produtos.dart';

class TelaLogin extends StatefulWidget {


  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {

    Login.logar("100000", "123456");
    return Scaffold(
      body: Container(

      ),
    );
  }
}
