

import 'package:flutter/material.dart';

class Fournisseur_Model extends ChangeNotifier{

  final int? id;
  final String? fullname;
  final String? company;
  final String? address;
  final String? willaya;
  final String? activite;
  final String? nif;
  final String? nic;
  final String? art;
  final String? rc;
  final int? telephone;

  Fournisseur_Model({this.id,this.fullname,this.company,this.address,this.willaya,this.activite,this.nif,this.nic,this.art,this.rc,this.telephone});

  factory Fournisseur_Model.fromMap(Map<String, dynamic> json) => Fournisseur_Model(
    id: json['id'],
    fullname:json['fullname'],
    company:json['company'] ,
    address: json['address'],
    willaya:json['willaya'] ,
    activite:json['activite'] ,
    nif: json['nif'],
    nic: json['nic'],
    art:json['art'] ,
    rc: json['rc'],
    telephone: json['telephone']
  );

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'fullname':fullname,
      'company':company,
      'address':address,
      'idwillaya':willaya,
      'activite':activite,
      'nif':nif,
      'nic':nic,
      'art':art,
      'rc':rc,
      'telephone':telephone,
    };

  }
  @override
  String toString(){
    return 'fournisseur{id: $id,fullname:$fullname,company:$company,address:$address,willaya:$willaya,activite:$activite,nif:$nif,nic:$nic,art:$art,rc:$rc,telephone:$telephone}';
  }


}