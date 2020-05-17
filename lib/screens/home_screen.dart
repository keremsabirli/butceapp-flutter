import 'package:butceappflutter/api/models/Expense.dart';
import 'package:butceappflutter/api/repositories/expense_repository.dart';
import 'package:butceappflutter/screens/expense_detail_screen.dart';
import 'package:butceappflutter/widgets/my_app_bar.dart';
import 'package:butceappflutter/widgets/my_navigation_bar.dart';
import 'package:butceappflutter/widgets/my_spinkit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final expenseRepository = new ExpenseRepository();
  List<Expense> expenses;
  @override
  void initState() {
    expenseRepository.get().then((expenses) {
     setState(() {
      this.expenses = expenses;
     });
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Harcamalar',),
      body: (expenses != null) ? ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          if(expenses != null) for(var expense in expenses) Card(
            child: InkWell(
              splashColor: Theme.of(context).primaryColor.withAlpha(60),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpenseDetailScreen(expense: expense)));
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(expense.name != null ? expense.name: "Loading") ,
                    subtitle: Text(expense.description != null ? expense.description: "Loading"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ) : MySpinKit(),
      bottomNavigationBar: MyBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/expense/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
