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

      Navigator.pushReplacementNamed(context, '/hospital');
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
        backgroundColor: Colors.blue,
        body: Builder(
            builder: (context) => Container(
                  padding: EdgeInsets.only(
                    top: 100,
                    left: 40,
                    right: 40,
                  ),
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        width: 128,
                        height: 128,
                        child: Image.asset('assets/img/slide-rescar.png'),
                      ),
                      Container(
                        height: 20,
                        alignment: Alignment.center,
                        child: Text(
                          '+Saúde',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _pass,
                        obscureText: true,
                        style: new TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ButtonTheme(
                        height: 60.0,
                        child: RaisedButton(
                          onPressed: () => {doLogin(context)},
                          child: Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                )));
  }
}

// Padding(
//             padding: EdgeInsets.all(10),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 128,
//                     height: 128,
//                     child: Image.asset('assets/icon/logo.png'),
//                   ),
//                   Divider(),
//                   TextFormField(
//                     autofocus: true,
//                     controller: _email,
//                     keyboardType: TextInputType.emailAddress,
//                     style: new TextStyle(color: Colors.white, fontSize: 20),
//                     decoration: InputDecoration(
//                         labelText: 'Email',
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   Divider(),
//                   TextFormField(
//                     keyboardType: TextInputType.text,
//                     controller: _pass,
//                     obscureText: true,
//                     style: new TextStyle(color: Colors.white, fontSize: 20),
//                     decoration: InputDecoration(
//                         labelText: 'Senha',
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   Divider(),
//                   ButtonTheme(
//                     height: 60.0,
//                     child: RaisedButton(
//                       onPressed: () => {doLogin(context)},
//                       child: Text(
//                         'Entrar',
//                         style: TextStyle(color: Colors.green[900]),
//                       ),
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
