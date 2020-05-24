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
  List<ReportData> reportData = new List<ReportData>();
  ExpenseRepository expenseRepository = new ExpenseRepository();
  List<String> _reports = <String>[
    'Günlük',
    'Haftalık',
    'Aylık'
  ];
  getReportData() {
    this.expenseRepository.getReportData().then((value) {
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
    this.getReportData();
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
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              DropdownButton(
                onChanged: (value) {
                  setState(() {
                    this.selectedReport = value;
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
              DropdownButton(
                hint: Text('Kategori'),
                value: selectedReport,
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
