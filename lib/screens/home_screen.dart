import 'package:butceappflutter/widgets/my_app_bar.dart';
import 'package:butceappflutter/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Harcamalar',),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            child: InkWell(
              splashColor: Theme.of(context).primaryColor.withAlpha(60),
              onTap: () {
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('First expense'),
                    subtitle: Text('First expense description'),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              splashColor: Theme.of(context).primaryColor.withAlpha(60),
              onTap: () {

              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Second expense'),
                    subtitle: Text('Second expense description'),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
