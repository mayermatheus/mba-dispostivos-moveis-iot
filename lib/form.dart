import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rescar/models/item.dart';
import 'package:rescar/models/hospital.dart';

class FormPage extends StatefulWidget {

  //FormPage() : super();

  var items = new List<Item>();

  FormPage() {
    items = [];
    items.add(Item(title: "O local estava limpo", done: false));
    items.add(Item(title: "O local estava higienizado", done: true));
    items.add(Item(title: "Havia médicos", done: false));
    items.add(Item(title: "O local possuía medicação", done: false));
  }

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final databaseReference = FirebaseDatabase.instance.reference();
  BuildContext context;

  /* List<Hospital> _hospitais = Hospital.getHospitais();
  List<DropdownMenuItem<Hospital>> _dropdownMenuItems;
  Hospital _selectedHospital;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_hospitais);
    _selectedHospital = _dropdownMenuItems[0].value;
    super.initState();
  }
 
  List<DropdownMenuItem<Hospital>> buildDropdownMenuItems(List hospitais) {
    List<DropdownMenuItem<Hospital>> items = List();
    for (Hospital hospital in hospitais) {
      items.add(
        DropdownMenuItem(
          value: hospital,
          child: Text(hospital.name),
        ),
      );
    }
    return items;
  }
 
  onChangeDropdownItem(Hospital selectedHospital) {
    setState(() {
      _selectedHospital = selectedHospital;
    });
  } */

  void save(BuildContext context, Hospital hospital) async {
     User user = FirebaseAuth.instance.currentUser;
     var itemsJson = [];
     widget.items.forEach((element) { itemsJson.add(element.toJson());});
     //var hospitalJson = hospital.toJson();
     //hospitalJson['itens'] = itemsJson;

    try {
      await databaseReference.child(user.uid).child(hospital.id.toString()).set({
        'hospital': hospital.toJson(), 
        'items': itemsJson
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Avaliação concluída com sucesso.'),
        backgroundColor: Colors.green[700],
      ));
      await Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushReplacementNamed(context, '/hospital');
      });

    } catch (error) {
      print("Error ${error.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Algo inesperado aconteceu. Tente novamente.'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Hospital hospital = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("+Saúde " + hospital.name),
      ),

      body: Builder(
        builder : (BuildContext context){
          this.context = context;
          return Scaffold(
            
            body: 
              ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final item = widget.items[index];
                  return CheckboxListTile(
                    title: Text(item.title),
                    key: Key(item.title),
                    value: item.done, 
                    onChanged: (value) {
                      setState(() {
                        item.done = value;
                      });
                    });
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                save(context, hospital);
              },
              child: Icon(Icons.save),
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
      )
    );
  } 
}



/*return  Scaffold(
      //debugShowCheckedModeBanner: false,
      //home: new Scaffold(
      appBar: new AppBar(
      title: new Text("+Saúde " + hospital.name),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done, 
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            });
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          save(context, hospital);
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.blueAccent,
        ),
      //),
    ); */


/* Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Selecione o Hospital"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedHospital,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedHospital.name}'),
              ],
            ),
          ),
        ), */