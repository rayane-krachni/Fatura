
import 'package:flutter/material.dart';

class Produit_Model extends ChangeNotifier{
  final int? id;
  final String? name;
  final int? tva;
  final double? prix;
  final String? code;
  final int? stock;

  Produit_Model({this.id,this.name,this.tva,this.prix,this.code,this.stock});

  factory Produit_Model.formMap(Map<String,dynamic> json)=>Produit_Model(
    id: json['id'],
    name: json['name'],
    tva: json['tva'],
    prix: json['prix'],
    code: json['code'],
    stock: json['stock']
  );

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'tva':tva,
      'prix':prix,
      'code':code,
      'stock':stock,

  };}

  @override
  String toString() {
    // TODO: implement toString
    return 'produit{id:$id,name:$name,tva:$tva,prix:$prix,code:$code,stock:$stock,}';
  }

}