

import 'package:flutter/cupertino.dart';

class Client_Manage extends ChangeNotifier {

  bool _loading=false;

  bool get loading =>  _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  notifyListeners();

}