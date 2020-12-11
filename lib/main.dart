import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rescar/util/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RescarApp());
}

class RescarApp extends StatelessWidget {
  const RescarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouterGenerator.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ));
  }
}
