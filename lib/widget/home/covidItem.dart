import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_app/model/covid19api.dart';
import 'package:intl/intl.dart';

class CovidWidget extends StatefulWidget {
  final Country countryReport;

  CovidWidget({Key key, this.countryReport}) : super(key: key);

  @override
  _CovidWidgetState createState() => _CovidWidgetState();
}

class _CovidWidgetState extends State<CovidWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 18, 8, 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _columnItem("Case"),
                  ),
                  Expanded(
                    flex: 2,
                    child: _columnItem("Recovered"),
                  ),
                  Expanded(
                    flex: 1,
                    child: _columnItem("Death"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _title() {
    var title = widget.countryReport.country;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _columnItem(String type) {
    var countryReport = widget.countryReport;
    switch (type) {
      case "Case":
        return _columnItemBuild(type, countryReport.totalConfirmed,
            countryReport.newConfirmed, Colors.blue[300]);
      case "Recovered":
        return _columnItemBuild(type, countryReport.totalRecovered,
            countryReport.newRecovered, Colors.green[400]);
      case "Death":
        return _columnItemBuild(type, countryReport.totalDeaths,
            countryReport.newDeaths, Colors.red[300]);
    }
  }

  _columnItemBuild(String title, int total, int add, Color addColor) {
    var list = <Widget>[_totalDataText(total)];
    if (add != null) list.add(_addDataText(add, addColor));
    return Column(
        children: <Widget>[
          _columnTitleText(title),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: list,
          )
        ]
    );
  }

  _columnTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  _totalDataText(int number) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(
        formatNumber(number),
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  _addDataText(int number, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(
        '+${formatNumber(number)}',
        style: TextStyle(fontSize: 16.0, color: color),
      ),
    );
  }

  formatNumber(int number) {
    return NumberFormat("#,###", "en_US").format(number);
  }
}
