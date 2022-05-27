

import 'package:flutter/cupertino.dart';

class Bills_Manage extends ChangeNotifier {

  bool _loadingbills=false;

  bool get loadingbills =>  _loadingbills;

  set loadingbills(bool value){
    _loadingbills = value;
    notifyListeners();
  }

  bool _loadingclient=false;

  bool get loadingclient =>  _loadingclient;

  set loadingclient(bool value){
    _loadingclient = value;
    notifyListeners();
  }

  bool _loadingfournisseur=false;

  bool get loadingfournisseur =>  _loadingfournisseur;

  set loadingfournisseur(bool value){
    _loadingfournisseur = value;
    notifyListeners();
  }

  bool _incriment=false;

  bool get incriment =>  _incriment;

  set incriment(bool value){
    _incriment = value;
    notifyListeners();
  }


  bool _loadingenvoices=false;

  bool get loadingenvoices =>  _loadingenvoices;

  set loadingenvoices(bool value){
    _loadingenvoices = value;
    notifyListeners();
  }

  notifyListeners();

}