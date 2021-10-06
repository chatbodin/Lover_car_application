import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

class DataServiceModel {
  final Timestamp chooseDate;
  final String typeService;
  final int odometer;
  final int price;
  final String remark;
  DataServiceModel({
    @required this.chooseDate,
    @required this.typeService,
    @required this.odometer,
    @required this.price,
    @required this.remark,
  });

  DataServiceModel copyWith({
    Timestamp chooseDate,
    String typeService,
    int odometer,
    int priceAll,
    String remark,
  }) {
    return DataServiceModel(
      chooseDate: chooseDate ?? this.chooseDate,
      typeService: typeService ?? this.typeService,
      odometer: odometer ?? this.odometer,
      price: price ?? this.price,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chooseDate': chooseDate,
      'typeService': typeService,
      'odometer': odometer,
      'price': price,
      'remark': remark,
    };
  }

  factory DataServiceModel.fromMap(Map<String, dynamic> map) {
    return DataServiceModel(
      chooseDate: map['chooseDate'],
      typeService: map['typeService'],
      odometer: map['odometer'],
      price: map['price'],
      remark: map['remark'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataServiceModel.fromJson(String source) =>
      DataServiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataServiceModel(chooseDate: $chooseDate, typeService: $typeService, odometer: $odometer,price: $price, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataServiceModel &&
        other.chooseDate == chooseDate &&
        other.typeService == typeService &&
        other.odometer == odometer &&
        other.price == price &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return chooseDate.hashCode ^
        typeService.hashCode ^
        odometer.hashCode ^
        price.hashCode ^
        remark.hashCode;
  }
}
