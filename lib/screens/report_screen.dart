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
  String title;
  DateTime startDate = null;
  DateTime endDate = null;
  List<ReportData> reportData = new List<ReportData>();
  ExpenseRepository expenseRepository = new ExpenseRepository();
  List<String> _reports = <String>['Günlük', 'Aylık'];
  Future<Null> _selectStartDate(BuildContext context) async {
    final DateTime _selectStartDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2022),
        helpText: 'Başlangıç Tarihini Seçiniz',
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        }).then((date) {
      if (date != null) {
        setState(() {
          this.startDate = date;
          currentDateString();
        });
        print(this.startDate);
      }
    });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime _selectEndDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2022),
        helpText: 'Başlangıç Tarihini Seçiniz',
        cancelText: '',
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        }).then((date) {
      if (date != null) {
        setState(() {
          this.endDate = date;
          currentDateString();
        });
        print(this.endDate);
      }
    });
  }

  getReportData({String reportType, DateTime startDate, DateTime endDate}) {
    if (startDate == null || endDate == null) {
      this
          .expenseRepository
          .getReportData(reportType: reportType)
          .then((value) {
        List<ReportData> temp = new List<ReportData>();
        value.forEach((key, value) {
          temp.add(new ReportData(date: key, value: value));
        });
        setState(() {
          this.reportData = temp;
        });
      });
    } else {
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
  }

  currentDateString() {
    this.title = 'Start:  ' +
        startDate.day.toString() +
        '/' +
        startDate.month.toString() +
        '/' +
        startDate.year.toString() +
        '    ' +
        'End:  ' +
        endDate.day.toString() +
        '/' +
        endDate.month.toString() +
        '/' +
        endDate.year.toString();
    setState(() {});
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
              title: ChartTitle(
                text: this.title,
              ),
              series: <LineSeries<ReportData, String>>[
                LineSeries<ReportData, String>(
                    // Bind data source
                    dataSource: this.reportData,
                    xValueMapper: (ReportData sales, _) => sales.date,
                    yValueMapper: (ReportData sales, _) => sales.value),
              ]),
          Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              DropdownButton(
                onChanged: (value) {
                  setState(() {
                    this.selectedReport = value;
                    this.getReportData(reportType: value);
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
              SizedBox(
                width: 25,
              ),
              RaisedButton(
                child: Text('Start Date'),
                onPressed: () {
                  this._selectStartDate(context);
                  print(startDate);
                  print(endDate);
                  this.getReportData(
                      reportType: selectedReport,
                      startDate: startDate,
                      endDate: endDate);
                },
              ),
              SizedBox(
                width: 25,
              ),
              RaisedButton(
                child: Text('End Date'),
                onPressed: () {
                  this._selectEndDate(context);
                  print(startDate);
                  print(endDate);
                  this.getReportData(
                      reportType: selectedReport,
                      startDate: startDate,
                      endDate: endDate);
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
