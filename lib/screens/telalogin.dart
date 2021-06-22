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

    final _formKey = GlobalKey<FormState>();
    TextEditingController _controllerLogin = new TextEditingController();
    TextEditingController _controllerSenha = new TextEditingController();



    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Fazer login",
                style: TextStyle(
                    fontSize: 16,
                    color: preto,
                    fontWeight: FontWeight.bold
                ),
              ),
              Image.asset('assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo é obrigatorio';
                        }
                        return null;
                      },
                      controller: _controllerLogin,
                      decoration: InputDecoration(
                          filled: false,
                          labelText: "Login",
                          alignLabelWithHint: true,

                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo é obrigatorio';
                        }
                        return null;
                      },
                      controller: _controllerSenha,
                      decoration: InputDecoration(
                          filled: false,
                          labelText: "Senha"
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
