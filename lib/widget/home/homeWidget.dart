import 'package:flutter/material.dart';
import 'package:home_app/model/covid19api.dart';
import 'package:home_app/service/covid19apiService.dart';
import 'package:home_app/widget/home/covidItem.dart';
import 'package:home_app/widget/home/globalItem.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Covid19api> covid19api;

  @override
  void initState() {
    super.initState();
    covid19api = Covid19apiService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Covid19api>(
        future: covid19api,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: _covidItem(snapshot.data),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error));
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  _covidItem(Covid19api covid19api) {
    covid19api.countries.sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));
    List<Widget> items = <Widget>[
      _pageTitle(),
      GlobalItemWidget(isNew: true, globalReport: covid19api.global),
      GlobalItemWidget(isNew: false, globalReport: covid19api.global),
    ];
    covid19api.countries
        .forEach((element) => items.add(CovidWidget(countryReport: element)));
    return items;
  }

  _pageTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 13, top: 18),
      child: Text('Covid-19', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }
}
