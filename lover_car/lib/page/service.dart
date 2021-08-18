import 'package:flutter/material.dart';
import 'package:lover_car/widget/signout.dart';

class Sercar extends StatefulWidget {
  @override
  _SercarState createState() => _SercarState();
}

class _SercarState extends State<Sercar> {
  final List<String> typecar = [
    'Toyota',
    'Honda',
    'Isuzu',
    'Suzuki',
    'Benz',
    'Mg',
    'Mitsubishi',
    'Ford',
    'Nissan',
    'Mazda'
  ];
  final List<String> Toyotaprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Hondaprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Isuzuprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Suzukiprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Benzprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Mgprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Mitsubishiprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Fordprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Nissanprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];
  final List<String> Mazdaprovince = [
    'จังหวัดพะเยา',
    'จังหวัดลำปาง',
    'จังหวัดลำพูน',
    'จังหวัดเชียงใหม่',
    'จังหวัดเชียงราย'
  ];

  String? selectedtypecar;
  String? selectedprovince;
  List<String> providers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ศูนย์รถยนต์'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // Country Dropdown
          DropdownButton<String>(
            hint: Text('เลือกรุ่นรถยนต์'),
            value: selectedtypecar,
            isExpanded: true,
            items: typecar.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (typecars) {
              if (typecars == 'Toyota') {
                providers = Toyotaprovince;
              } else if (typecars == 'Honda') {
                providers = Hondaprovince;
              } else if (typecars == 'Isuzu') {
                providers = Isuzuprovince;
              } else if (typecars == 'Suzuki') {
                providers = Suzukiprovince;
              } else if (typecars == 'Benz') {
                providers = Benzprovince;
              } else if (typecars == 'Mg') {
                providers = Mgprovince;
              } else if (typecars == 'Mitsubishi') {
                providers = Mitsubishiprovince;
              } else if (typecars == 'Ford') {
                providers = Fordprovince;
              } else if (typecars == 'Nissan') {
                providers = Nissanprovince;
              } else if (typecars == 'Mazda') {
                providers = Mazdaprovince;
              } else {
                providers = [];
              }
              setState(() {
                selectedprovince = null;
                selectedtypecar = typecars;
              });
            },
          ),
          // typecar Dropdown Ends here
          SizedBox(height: 40.0),
          // providers Dropdown
          DropdownButton<String>(
            hint: Text('เลือกจังหวัด'),
            value: selectedprovince,
            isExpanded: true,
            items: providers.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (providers) {
              setState(() {
                selectedprovince = providers;
              });
            },
          ),
        ],
      ),
    );
  }
}
