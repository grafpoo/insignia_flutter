import 'package:flutter/material.dart';
import 'package:insignia_flutter/provider.dart';
import 'package:insignia_flutter/shared_lib.dart';

class BranchPicker extends StatefulWidget {
  @override
  _BranchPickerState createState() => _BranchPickerState();
}

class _BranchPickerState extends State<BranchPicker> {
  Provider _provider;
  String _radioValue;

  _BranchPickerState() {
    _provider = Provider();
    _radioValue = _provider.getRadioValue();
  }

  void _handleRadioValueChange(String value) {
    _radioValue = value;
    // persist current value
    _provider.setRadioValue(_radioValue);
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // army
                new Radio(
                  value: InsigniaLists.USA_NAME,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.USA_NAME,
                  style: new TextStyle(fontSize: 16.0),
                ),
                //navy
                new Radio(
                  value: InsigniaLists.USN_NAME,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.USN_NAME,
                  style: new TextStyle(fontSize: 16.0),
                ),
                // air force
                new Radio(
                  value: InsigniaLists.USAF_NAME,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.USAF_NAME,
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // marines
                new Radio(
                  value: InsigniaLists.USMC_NAME,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.USMC_NAME,
                  style: new TextStyle(fontSize: 16.0),
                ),
                //navy
                new Radio(
                  value: InsigniaLists.USCG_NAME,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.USCG_NAME,
                  style: new TextStyle(fontSize: 16.0),
                ),
                // air force
                new Radio(
                  value: InsigniaLists.ALL,
                  groupValue: _provider.getRadioValue(),
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  InsigniaLists.ALL,
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        )));
  }
}
