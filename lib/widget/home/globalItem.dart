import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_app/model/covid19api.dart';
import 'package:intl/intl.dart';

class GlobalItemWidget extends StatefulWidget {
  final bool isNew;
  final Country globalReport;

  GlobalItemWidget({Key key, this.isNew, this.globalReport}) : super(key: key);

  @override
  _GlobalItemState createState() => _GlobalItemState();
}

class _GlobalItemState extends State<GlobalItemWidget> {
  Color color;
  String title;
  int cases;
  int recovered;
  int death;

  @override
  Widget build(BuildContext context) {
    dataSwitch();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(),
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: color, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _columnItem(String type) {
    switch (type) {
      case "Case":
        return _columnItemBuild(type, cases);
      case "Recovered":
        return _columnItemBuild(type, recovered);
      case "Death":
        return _columnItemBuild(type, death);
    }
  }

  _columnItemBuild(String title, int total) {
    var list = <Widget>[_totalDataText(total)];
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
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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

  formatNumber(int number) {
    return NumberFormat("#,###", "en_US").format(number);
  }

  dataSwitch() {
    if (widget.isNew) {
      title = 'New';
      color = Colors.red[300];
      cases = widget.globalReport.newConfirmed;
      recovered = widget.globalReport.newRecovered;
      death = widget.globalReport.newDeaths;
    } else {
      title = 'Total';
      color = Colors.cyan[600];
      cases = widget.globalReport.totalConfirmed;
      recovered = widget.globalReport.totalRecovered;
      death = widget.globalReport.totalDeaths;
    }
  }
}