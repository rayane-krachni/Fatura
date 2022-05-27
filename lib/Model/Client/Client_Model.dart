

import 'package:flutter/material.dart';

class Client_Model extends ChangeNotifier{
  final int? id;
  final String? fullname;
  final String? address;
  final String? willaya;
  final String? activite;
  final String? nif;
  final String? nic;
  final String? art;
  final String? rc;
  final int? telephone;

  Client_Model({this.id, this.fullname, this.address, this.willaya, this.activite, this.nif, this.nic, this.art, this.rc, this.telephone});

  factory Client_Model.fromMap(Map<String, dynamic> json) => Client_Model(
      id: json['id'],
      fullname: json['fullname'],
      address: json['address'],
      willaya: json['willaya'],
      activite: json['activite'],
      nif: json['nif'],
      nic: json['nic'],
      rc: json['rc'],
      art: json['art'],
      telephone: json['telephone']);

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'fullname':fullname,
      'address':address,
      'willaya':willaya,
      'activite':activite,
      'nif':nif,
      'nic':nic,
      'art':art,
      'rc':rc,
      'telephone':telephone

    };

  }
  @override
  String toString(){
    return 'client{id: $id,fullname:$fullname,address:$address,willaya:$willaya,activite:$activite,nif:$nif,nic:$nic,art:$art,rc:$rc,telephone:$telephone}';
  }


}