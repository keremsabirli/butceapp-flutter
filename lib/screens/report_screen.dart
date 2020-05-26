import 'dart:collection';

import 'package:butceappflutter/api/repositories/expense_repository.dart';
import 'package:butceappflutter/widgets/my_app_bar.dart';
import 'package:butceappflutter/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedReport = 'Günlük';
  DateTime startDate = DateTime.utc(1, 1, 1);
  DateTime endDate = DateTime.utc(2999, 12, 30);
  List<ReportData> reportData = new List<ReportData>();
  ExpenseRepository expenseRepository = new ExpenseRepository();
  List<String> _reports = <String>['Günlük', 'Aylık'];
  Future<Null> _selectStartDate(BuildContext context) async {
    final DateTime _selectStartDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2022),
        helpText: 'Başlangıç Tarihini Seçiniz',
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        }).then((date) {
      setState(() {
        this.startDate = date;
      });
      print(this.startDate);
    });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime _selectEndDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2022),
        helpText: 'Başlangıç Tarihini Seçiniz',
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        }).then((date) {
      setState(() {
        this.endDate = date;
      });
      print(this.endDate);
    });
  }

  getReportData({String reportType, DateTime startDate, DateTime endDate}) {
    this
        .expenseRepository
        .getReportData(
            reportType: reportType, startDate: startDate, endDate: endDate)
        .then((value) {
      List<ReportData> temp = new List<ReportData>();
      value.forEach((key, value) {
        temp.add(new ReportData(date: key, value: value));
      });
      setState(() {
        this.reportData = temp;
      });
    });
  }

  @override
  void initState() {
    this.getReportData(reportType: 'Günlük');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Rapor'),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10),
          SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <LineSeries<ReportData, String>>[
            LineSeries<ReportData, String>(
                // Bind data source
                dataSource: this.reportData,
                xValueMapper: (ReportData sales, _) => sales.date,
                yValueMapper: (ReportData sales, _) => sales.value),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                onChanged: (value) {
                  setState(() {
                    this.selectedReport = value;
                    this.getReportData(
                        reportType: value,
                        startDate: startDate,
                        endDate: endDate);
                  });
                },
                hint: Text('Kategori'),
                value: selectedReport,
                items: _reports.map((report) {
                  return DropdownMenuItem(
                    child: new Text(report),
                    value: report,
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Start Date'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  setState(() {
                    this._selectStartDate(context).then((value) {
                      this.getReportData(
                          reportType: selectedReport,
                          startDate: startDate,
                          endDate: endDate);
                    });
                  });
                },
              ),
              SizedBox(
                width: 25,
              ),
              RaisedButton(
                child: Text('End Date'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  setState(() {
                    this._selectEndDate(context).then((value) {
                      this.getReportData(
                          reportType: selectedReport,
                          startDate: startDate,
                          endDate: endDate);
                    });
                  });
                },
              ),
              SizedBox(
                width: 25,
              ),
              RaisedButton(
                child: Text('Reset'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  setState(() {
                    this.startDate = DateTime.utc(1,1,1);
                    this.endDate = DateTime.utc(9000,1,1);
                    this.getReportData(
                          reportType: selectedReport,
                          startDate: startDate,
                          endDate: endDate);
                  });
                },
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class ReportData {
  ReportData({this.date, this.value});
  final String date;
  final double value;
}
