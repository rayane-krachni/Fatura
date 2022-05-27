
import 'package:flutter/material.dart';

class ProduitFacture_Model extends ChangeNotifier{
  final int? id;
  final String? name;



  ProduitFacture_Model({this.id,this.name});

  factory ProduitFacture_Model.fromMap(Map<String, dynamic> json) => ProduitFacture_Model(
      id: json['id'],
      name: json['name'],

  );

  Map< String , dynamic> toMap(){
    return {
      'id':id,
      'name':name,


    };}

  @override
  String toString() {
    // TODO: implement toString
    return 'produit{id:$id,name:$name}';
  }

}