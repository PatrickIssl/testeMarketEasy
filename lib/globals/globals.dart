import 'package:flutter/material.dart';

var urlPostLogin = Uri.http('servicosflex.rpinfo.com.br:9000', '/v1.1/auth');
var urlGetProduto = Uri.http('servicosflex.rpinfo.com.br:9000', '/v2.0/produtounidade/listaprodutos/0/unidade/83402711000110');

String token = "";
String tokenExpiration = "";

var preto = Colors.black;