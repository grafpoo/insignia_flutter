import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:insignia_flutter/branch_picker.dart';
import 'package:insignia_flutter/menu/app_menu_drawer.dart';
import 'dart:math';

import '../provider.dart';

const double _imageHeight = 180.0;
final Logger log = new Logger('insignia');
var _rng = new Random();

class PracticePage extends StatefulWidget {
  String _title;

  PracticePage() {
    _title = "Study Guide for " + Provider().getRadioValue();
  }

  String title = "Practice Page";

  @override
  _PracticePageState createState() => _PracticePageState();

  @override
  Widget get menuDrawer => AppMenu();
}

class _PracticePageState extends State<PracticePage> {
  Provider _provider = Provider();
  _PracticePageState() {
    _currentInsigniaIndex = _rng.nextInt(
        _provider.currentInsigniaList().length);
  }

  int _currentInsigniaIndex;

  String _currentService = "";
  String _currentRank = "";
  String _currentEoLevel = "";

  @override
  Widget build(BuildContext context) {
//    Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BranchPicker(),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white30.withOpacity(0.25),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Image.asset(
              _provider.currentInsigniaList()[_currentInsigniaIndex]
                  .imageResource,
              height: _imageHeight,
            ),
          ),
          Text(
            '$_currentService\n$_currentRank\n$_currentEoLevel',
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      child: Text("Check Answer"),
                      onPressed: () {
                        displayAnswer();
                      })),
              Expanded(
                  child: ElevatedButton(
                      child: Text("Next"),
                      onPressed: () {
                        redisplayListItems();
                      })),
              Expanded(
                child: ElevatedButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  void redisplayListItems() {
    setState(() {
      var prev = _currentInsigniaIndex;
      while (prev == _currentInsigniaIndex) {
        _currentInsigniaIndex = _rng.nextInt(_provider.currentInsigniaList().length);
      }
      _currentService = "";
      _currentRank = "";
      _currentEoLevel = "";
    });
  }

  void displayAnswer() {
    setState(() {
        var _curBranch = _provider.currentInsigniaList()[_currentInsigniaIndex]
            .branch;
        _currentService = "Service: $_curBranch";
        var _curRank = _provider.currentInsigniaList()[_currentInsigniaIndex]
            .rank;
        _currentRank = "Rank: $_curRank";
        var _curEOLevel = _provider.currentInsigniaList()[_currentInsigniaIndex]
            .eoLevel;
        _currentEoLevel = "Grade: $_curEOLevel";
    });
  }
}

class Tabulator {
  Map<String, List<String>> _tabulation = {};

  void add(String key, String value) {
    // add to map
    if (_tabulation.containsKey(key)) {
      _tabulation[key].add(value);
    } else {
      List<String> branches = [value];
      _tabulation[key] = branches;
    }
  }

  String toFancyString(String header, String entry) {
    var str = "$header Tabulator";
    for (var eo in _tabulation.keys) {
      str = "$str\n\t$entry: ";
      for (var b in _tabulation[eo]) {
        str = "$str$b|";
      }
      str = "$str\n";
    }
  }
}

class RankTabulator extends Tabulator {
  String getRankString() {
    String rankStr;
    // now sort out EOs - if only one, list it without branches
    if (_tabulation.length == 0) {
      // wtf
      rankStr = "";
    } else if (_tabulation.length == 1) {
      var soleRank = _tabulation.keys.toList()[0];
      rankStr = "Rank: $soleRank";
    } else {
      rankStr = "Rank: ";
      var rankDiv = "";
      for (var eo in _tabulation.keys) {
        rankStr = "$rankStr$rankDiv$eo (";
        rankDiv = ", ";
        var brDiv = "";
        for (var brs in _tabulation[eo]) {
          rankStr = "$rankStr$brDiv$brs";
          brDiv = "/";
        }
        rankStr = "$rankStr)";
      }
    }
    return rankStr;
  }

  bool multiple() {
    return _tabulation.length > 0;
  }
}

class EoTabulator extends Tabulator {
  String getEoString() {
    String eoStr;
    // now sort out EOs - if only one, list it without branches
    if (_tabulation.length == 0) {
      // wtf
      eoStr = "";
    } else if (_tabulation.length == 1) {
      var soleEO = _tabulation.keys.toList()[0];
      eoStr = "Grade: $soleEO";
    } else {
      eoStr = "Grade: ";
      var eoDiv = "";
      for (var eo in _tabulation.keys) {
        eoStr = "$eoStr$eoDiv$eo (";
        eoDiv = ", ";
        var brDiv = "";
        for (var brs in _tabulation[eo]) {
          eoStr = "$eoStr$brDiv$brs";
          brDiv = "/";
        }
        eoStr = "$eoStr)";
      }
    }
    return eoStr;
  }
}
