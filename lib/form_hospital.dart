import 'package:flutter/material.dart';
import 'package:rescar/form.dart';
import 'package:rescar/models/item.dart';
import 'package:rescar/models/hospital.dart';

class FormHospitalPage extends StatefulWidget {

  var hospitais = new List<Hospital>();

  FormHospitalPage() {
    hospitais = [];
    hospitais.add(Hospital(id: 1, name: 'H. São José', estado: 'CE'));
    hospitais.add(Hospital(id: 2, name: 'Albert Einstein', estado: 'SP'));
    hospitais.add(Hospital(id: 3, name: 'Sirio Libanes', estado: 'SP'));
    hospitais.add(Hospital(id: 4, name: 'UPA', estado: 'PB'));
  }

  @override
  _FormHospitalPageState createState() => _FormHospitalPageState();
}

class _FormHospitalPageState extends State<FormHospitalPage> {

  void add() {
    //pegar o hospital, pessoa e os items
    //enviar para o firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('+Saúde'),
      ),
      body: ListView.builder(
        itemCount: widget.hospitais.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.hospitais[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormPage(),
                  settings: RouteSettings(
                    arguments: widget.hospitais[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}