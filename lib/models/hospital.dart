class Hospital {
  int id;
  String name;
  String estado;

  Hospital({this.id, this.name, this.estado});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['estado'] = this.estado;
    return data;
  }

  static List<Hospital> getHospitais() {
    var hospitais = new List<Hospital>();
    hospitais.add(Hospital(id: 1, name: 'H. São José', estado: 'CE'));
    hospitais.add(Hospital(id: 2, name: 'Albert Einstein', estado: 'SP'));
    hospitais.add(Hospital(id: 3, name: 'Sirio Libanes', estado: 'SP'));
    hospitais.add(Hospital(id: 4, name: 'UPA', estado: 'PB'));
    return hospitais;
  }

}
