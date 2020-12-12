import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rescar/util/route_generator.dart';

void main() {
  runApp(RescarApp());
}

class RescarApp extends StatelessWidget {
  const RescarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "+Saúde",
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
