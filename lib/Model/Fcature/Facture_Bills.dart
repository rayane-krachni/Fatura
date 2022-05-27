
import 'package:flutter/material.dart';

class FactureBills_Model extends ChangeNotifier{
  final int? id;
  final int? num_facture;



  FactureBills_Model({this.id,this.num_facture});

  factory FactureBills_Model.fromMap(Map<String, dynamic> json) => FactureBills_Model(
    id: json['id'],
    num_facture: json['num_facture'],

  );

  Map< String, dynamic> toMap(){
    return{
      'id':id,
      'num_facture':num_facture,

    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'envoice{id:$id,num_facture:$num_facture}';
  }
}