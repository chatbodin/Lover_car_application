import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataFuleModel {
  final Timestamp chooseDate;
  final String typeFule;
  final int odometer;
  final double pricePerLit;
  final int priceAll;
  final double lit;
  final String remark;
  DataFuleModel({
    @required this.chooseDate,
    @required this.typeFule,
    @required this.odometer,
    @required this.pricePerLit,
    @required this.priceAll,
    @required this.lit,
    @required this.remark,
  });

  DataFuleModel copyWith({
    Timestamp chooseDate,
    String typeFule,
    int odometer,
    double pricePerLit,
    int priceAll,
    double lit,
    String remark,
  }) {
    return DataFuleModel(
      chooseDate: chooseDate ?? this.chooseDate,
      typeFule: typeFule ?? this.typeFule,
      odometer: odometer ?? this.odometer,
      pricePerLit: pricePerLit ?? this.pricePerLit,
      priceAll: priceAll ?? this.priceAll,
      lit: lit ?? this.lit,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chooseDate': chooseDate,
      'typeFule': typeFule,
      'odometer': odometer,
      'pricePerLit': pricePerLit,
      'priceAll': priceAll,
      'lit': lit,
      'remark': remark,
    };
  }

  factory DataFuleModel.fromMap(Map<String, dynamic> map) {
    return DataFuleModel(
      chooseDate: map['chooseDate'],
      typeFule: map['typeFule'],
      odometer: map['odometer'],
      pricePerLit: map['pricePerLit'],
      priceAll: map['priceAll'],
      lit: map['lit'],
      remark: map['remark'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataFuleModel.fromJson(String source) =>
      DataFuleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataFuleModel(chooseDate: $chooseDate, typeFule: $typeFule, odometer: $odometer, pricePerLit: $pricePerLit, priceAll: $priceAll, lit: $lit, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataFuleModel &&
        other.chooseDate == chooseDate &&
        other.typeFule == typeFule &&
        other.odometer == odometer &&
        other.pricePerLit == pricePerLit &&
        other.priceAll == priceAll &&
        other.lit == lit &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return chooseDate.hashCode ^
        typeFule.hashCode ^
        odometer.hashCode ^
        pricePerLit.hashCode ^
        priceAll.hashCode ^
        lit.hashCode ^
        remark.hashCode;
  }
}
