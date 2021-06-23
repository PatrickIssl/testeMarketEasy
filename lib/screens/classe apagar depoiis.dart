recuperarToken();

if(token != ""){
tokenExpiration = DateTime.parse(data);
if(tokenExpiration.isAfter(DateTime.now())){
Navigator.pushReplacementNamed(context, '/produtos');
}
}




String data= "";

recuperarToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token")??"";
  data = prefs.getString("tokenExpiration")??"";
}