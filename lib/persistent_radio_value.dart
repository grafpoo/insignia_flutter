import 'package:insignia_flutter/shared_lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentRadioValue {
  String _radioKey;
  String _radioValue;

  PersistentRadioValue(String radioKey) {
    _radioKey = radioKey;
    // attempt to read radioValue from saved state
    _radioValue = InsigniaLists.ALL;
  }

  String getRadioValue() => _radioValue;

  void setRadioValue(String radioValue) {
    _radioValue = radioValue;
    // save current value
    var prValue = persistRadioValue();
    prValue.ignore();
  }

  Future<void> persistRadioValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_radioKey, _radioValue);
  }

  Future<void> getPersistents() async {
    final prefs = await SharedPreferences.getInstance();
    final counter =
        prefs.getString(_radioKey) ?? InsigniaLists.ALL;
    _radioValue = counter;
  }

}
