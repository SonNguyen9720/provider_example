import 'package:flutter/foundation.dart';

class MyModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    debugPrint(someValue);
    notifyListeners();
  }
}
