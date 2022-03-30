import 'package:insignia_flutter/persistent_radio_value.dart';
import 'package:insignia_flutter/shared_lib.dart';

class Provider {
  static Provider _instance;
  static const String CURRENT_SERVICE_RADIO_KEY = 'currentService';

  factory Provider() {
    if (_instance == null) {
      _instance = Provider._internal();
    }

    return _instance;
  }

  Provider._internal() {
    _radioValue = PersistentRadioValue(CURRENT_SERVICE_RADIO_KEY);
    _insigniaList = InsigniaLists();
  }

  PersistentRadioValue _radioValue;

  InsigniaLists _insigniaList;
  List<Insignia> currentInsigniaList() =>
      _insigniaList.getInsigniaList(getRadioValue());

  String getRadioValue() => _radioValue.getRadioValue();

  void setRadioValue(String radioValue) {
    _radioValue.setRadioValue(radioValue);
  }
}
