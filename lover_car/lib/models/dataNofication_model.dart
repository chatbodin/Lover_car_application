import 'dart:convert';
import 'package:flutter/material.dart';

class DataNofication {
  final String typeNoficationService;
  final String typeNoficationTax;
  final String remark;
  DataNofication({
    @required this.typeNoficationService,
    @required this.typeNoficationTax,
    @required this.remark,
  });

  DataNofication copyWith({
    String typeNoficationService,
    String typeNoficationTax,
    String remark,
  }) {
    return DataNofication(
      typeNoficationService:
          typeNoficationService ?? this.typeNoficationService,
      typeNoficationTax: typeNoficationTax ?? this.typeNoficationTax,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'typeNoficationService': typeNoficationService,
      'typeNoficationTax': typeNoficationTax,
      'remark': remark,
    };
  }

  factory DataNofication.fromMap(Map<String, dynamic> map) {
    return DataNofication(
      typeNoficationService: map['typeNoficationService'],
      typeNoficationTax: map['typeNoficationTax'],
      remark: map['remark'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataNofication.fromJson(String source) =>
      DataNofication.fromMap(json.decode(source));

  @override
  String toString() =>
      'DataNofication(typeNoficationService: $typeNoficationService, typeNoficationTax: $typeNoficationTax, remark: $remark)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataNofication &&
        other.typeNoficationService == typeNoficationService &&
        other.typeNoficationTax == typeNoficationTax &&
        other.remark == remark;
  }

  @override
  int get hashCode =>
      typeNoficationService.hashCode ^
      typeNoficationTax.hashCode ^
      remark.hashCode;
}
