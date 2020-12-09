import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  String get username => _email.text;
  String get password => _pass.text;

  void doLogin(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);

      print('Login feito para o usuario ${credential.user.uid}');
      _email.text = '';
      _pass.text = '';

      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      print("Error ${error.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Usuário ou senha incorretos'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[900],
        body: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _pass,
                    obscureText: true,
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () => {doLogin(context)},
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.green[900]),
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
