import 'package:flutter/material.dart';
import 'package:provider_example/my_model.dart';

class AnotherModel {
  // int someValue = 0;
  final MyModel _myModel;
  AnotherModel(this._myModel);

  // void doSomething() {
  //   someValue = 5;
  //   debugPrint('$someValue');
  //   notifyListeners();
  // }

  void doSomeThingElse() {
    _myModel.doSomething('See you later');
    debugPrint('Do something else');
  }
}
