import 'package:car_lovers/servicecar/ford_ser.dart';
import 'package:car_lovers/servicecar/honda_ser.dart';
import 'package:car_lovers/servicecar/isuzu_ser.dart';
import 'package:car_lovers/servicecar/mazda_ser.dart';
import 'package:car_lovers/servicecar/mg_ser.dart';
import 'package:car_lovers/servicecar/mitsubishi_ser.dart';
import 'package:car_lovers/servicecar/nissan_ser.dart';
import 'package:car_lovers/servicecar/suzuki_ser.dart';
import 'package:car_lovers/servicecar/toyota_ser.dart';
import 'package:flutter/material.dart';
import 'package:car_lovers/widget_drawer/signout.dart';

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
    'Mg',
    'Mitsubishi',
    'Ford',
    'Nissan',
    'Mazda'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Toyotaprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Hondaprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Isuzuprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Suzukiprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];

  // ignore: non_constant_identifier_names
  final List<String> Mgprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Mitsubishiprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Fordprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Nissanprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];
  // ignore: non_constant_identifier_names
  final List<String> Mazdaprovince = [
    'Phayao',
    'Lampang',
    'Lamphun',
    'Phrae',
    'ChiangRai'
  ];

  String selectedtypecar;
  String selectedprovince;
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
            onChanged: (String typecars) {
              if (typecars == 'Toyota') {
                providers = Toyotaprovince;
              } else if (typecars == 'Honda') {
                providers = Hondaprovince;
              } else if (typecars == 'Isuzu') {
                providers = Isuzuprovince;
              } else if (typecars == 'Suzuki') {
                providers = Suzukiprovince;
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
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Honda') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hondalampang(),
                      ));
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Honda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => hondaphayao(providers, "honda")),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Honda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hondalamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Honda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hondaphrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Honda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hondachiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Toyota') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toyotaserphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Toyota') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toyotaserlampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Toyota') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toyotaserlamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Toyota') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toyotaserPhrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Toyota') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => toyotaseChiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Isuzu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isuzuphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Isuzu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isuzulampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Isuzu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isuzulamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Isuzu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isuzuphrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Isuzu') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isuzuchiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Suzuki') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => suzukiphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Suzuki') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => suzukilampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Suzuki') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => suzukilamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Suzuki') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => suzukiPhrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Suzuki') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => suzukiChiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Mg') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mgphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Mg') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mglampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Mg') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mglamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Mg') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mgPhrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Mg') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mgChiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Mitsubishi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mitsubishiphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Mitsubishi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mitsubishilampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Mitsubishi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mitsubishilamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Mitsubishi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mitsubishiphrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Mitsubishi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mitsubishichiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Ford') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Ford') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordlampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Ford') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordlamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Ford') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordphrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Ford') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordChiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Nissan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nissanphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Nissan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nissanlampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Nissan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nissanlamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Nissan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nissanPhrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Nissan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nissanChiangrai()),
                  );
                }
              }
              if (providers == 'Phayao') {
                if (selectedtypecar == 'Mazda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mazdaphayao()),
                  );
                }
              }
              if (providers == 'Lampang') {
                if (selectedtypecar == 'Mazda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mazdalampang()),
                  );
                }
              }
              if (providers == 'Lamphun') {
                if (selectedtypecar == 'Mazda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mazdalamphun()),
                  );
                }
              }
              if (providers == 'Phrae') {
                if (selectedtypecar == 'Mazda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mazdaphrae()),
                  );
                }
              }
              if (providers == 'ChiangRai') {
                if (selectedtypecar == 'Mazda') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mazdaChiangrai()),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
