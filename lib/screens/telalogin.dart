import 'package:flutter/material.dart';
import 'package:testemarketeasy/globals/globals.dart';
import 'package:testemarketeasy/globals/methods/login.dart';
import 'package:testemarketeasy/globals/methods/produtos.dart';

class TelaLogin extends StatefulWidget {


  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Fazer login",
            style: TextStyle(
              fontSize: 12,
              color: preto
            ),
            ),

          ],
        ),
      ),
    );
  }
}
