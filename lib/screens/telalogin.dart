import 'package:flutter/material.dart';
import 'package:testemarketeasy/globals/globals.dart';
import 'package:testemarketeasy/globals/methods/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLogin extends StatefulWidget {


  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String data= "";

  recuperarToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token")??"";
    data = prefs.getString("tokenExpiration")??"";
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _controllerLogin = new TextEditingController();
    TextEditingController _controllerSenha = new TextEditingController();

    recuperarToken();

    if(token != ""){
      print(data);
      tokenExpiration = DateTime.parse(data);
      print(tokenExpiration);
      DateTime dataExpiracao = DateTime.parse(tokenExpiration.toString());
        if(dataExpiracao.isAfter(DateTime.now())){
          Navigator.pushReplacementNamed(context, 'produtos');
        }
    }

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
                    RaisedButton(
                        color:Colors.pink,
                        child: Text("Logar"),
                        onPressed: (){Login.logar(_controllerLogin.text, _controllerSenha.text);}),
                    RaisedButton(
                        color:Colors.pink,
                        child: Text("Apagar conta"),
                        onPressed: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove("token");
                          prefs.remove("tokenExpiration");
                        })
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
