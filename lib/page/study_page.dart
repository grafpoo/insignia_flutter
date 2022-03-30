import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../provider.dart';

const double imageHeight = 180.0;

class StudyPage extends StatelessWidget {
  String _title;

  Provider _provider = Provider();

  StudyPage() {
    _title = "Study Guide for " + _provider.getRadioValue();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 400.0,
              ),
              items: _provider.currentInsigniaList().map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white30.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              i.imageResource,
                              height: imageHeight,
                            ),
                          ),
                          Text(
                            "Service: " +
                                i.branch +
                                "\nRank: " +
                                i.rank +
                                "\nGrade: " +
                                i.eoLevel,
                          ),
                        ]);
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
                child: const Text('Done'),
                onPressed: () {
                  Navigator.pop(ctx);
                }),
          ]),
    );
  }

}
