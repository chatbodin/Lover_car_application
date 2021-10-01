import 'package:flutter/material.dart';

// ignore: camel_case_types
class List_car extends StatefulWidget {
  @override
  _List_carState createState() => _List_carState();
}

// ignore: camel_case_types
class _List_carState extends State<List_car> {
  // ignore: unused_field
  String _selected;
  // ignore: unused_field
  List<Map> _myJson = [
    {'id': '1', 'image': 'images/toyota.png', 'name': 'Toyota'},
    {'id': '2', 'image': 'images/honda.png', 'name': 'Honda'},
    {'id': '3', 'image': 'images/isuzu.png', 'name': 'Isuzu'},
    {'id': '4', 'image': 'images/suzuki.png', 'name': 'Suzuki'},
    {'id': '5', 'image': 'images/benz.png', 'name': 'Benz'},
    {'id': '6', 'image': 'images/mg.png', 'name': 'Mg'},
    {'id': '7', 'image': 'images/mitsubishi.png', 'name': 'Mitsubishi'},
    {'id': '8', 'image': 'images/ford.png', 'name': 'Ford'},
    {'id': '9', 'image': 'images/nissan.png', 'name': 'Nissan'},
    {'id': '10', 'image': 'images/mazda.png', 'name': 'Mazda'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 8,right: 8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    hint: Text('เลือกรุ่นรถยนต์'),
                    value: _selected,
                    onChanged: (newValue) {
                      setState(() {
                        _selected = newValue as String;
                      });
                    },
                    items: _myJson.map((carItem) {
                      return DropdownMenuItem(
                          value: carItem['id'].toString(),
                          child: Row(
                            children: [
                              Image.asset(carItem['image'], width: 25),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(carItem['name']),
                              )
                            ],
                          ));
                    }).toList(),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
