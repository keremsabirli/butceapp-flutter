import 'package:butceappflutter/widgets/my_app_bar.dart';
import 'package:butceappflutter/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseAddScreen extends StatefulWidget {
  @override
  _ExpenseAddScreenState createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {

  final _formKey = GlobalKey<FormState>();
  var selectedCategory;
  var selectedShop;
  var selectedCity;
  String selectedType;
  List<String> _accountType = <String>[
    'Nakit',
    'Kredi Kartı'
  ];
  List<String> _categories = <String>[
    'Akaryakıt',
    'Giyim',
    'Market',
    'Eğitim',
    'Kozmetik',
    'Temizlik',
    'Eğlence'
  ];
  List<String> _shops = <String>[
    'Mavi',
    'Burger King',
    'MAVİ',
    'A-101',
    'Şok',
    'Shell'
  ];
  List<String> _cities = <String>[
    'İstanbul',
    'Ankara',
    'Trabzon',
    'İzmir',
    'Sakarya',
    'Kocaeli',
    'Bursa',
    'Ankara',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Harcama Ekle",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.coins,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.book, //coins
                  size: 25.0,
                  color: Color(0xff11b719),
                ),
                SizedBox(
                  width: 25.0,
                ),
                new DropdownButton(
                  hint: Text('Kategori'),
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      child: new Text(category),
                      value: category,
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.shoppingBag, //coins
                  size: 25.0,
                  color: Color(0xff11b719),
                ),
                SizedBox(
                  width: 25.0,
                ),
                DropdownButton(
                  items: _shops
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: Color(0xff11b1719)),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (selectedShop) {
                    setState(() {
                      selectedType = selectedShop;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: Text(
                    'Mağaza',
                    style: TextStyle(color: Color(0xff11b1719)),
                  ),
                ),
              ],
            ),







            TextFormField(
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.coins,
                  color: Color(0xff11b719),
                ),
                hintText: 'Tutar giriniz   sadece rakam alır  ',
                //labelText: 'Acıklama Ekleyiniz',
              ),
            ),






            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.creditCard, //coins
                  size: 25.0,
                  color: Color(0xff11b719),
                ),
                SizedBox(
                  width: 25.0,
                ),
                DropdownButton(
                  items: _accountType
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: Color(0xff11b1719)),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (selectedAcoountType) {
                    setState(() {
                      selectedType = selectedAcoountType;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: Text(
                    'Ödeme şekli seçin',
                    style: TextStyle(color: Color(0xff11b1719)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.userCircle, //coins
                  size: 25.0,
                  color: Color(0xff11b719),
                ),
                SizedBox(
                  width: 50.0,
                ),
                DropdownButton(
                  items: _accountType
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: Color(0xff11b1719)),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (selectedAcoountType) {
                    setState(() {
                      selectedType = selectedAcoountType;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: Text(
                    'Kişi Seçiniz',
                    style: TextStyle(color: Color(0xff11b1719)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.city, //coins
                  size: 25.0,
                  color: Color(0xff11b719),
                ),
                SizedBox(
                  width: 50.0,
                ),
                DropdownButton(
                  items: _cities
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: Color(0xff11b1719)),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (selectedCity) {
                    setState(() {
                      selectedType = selectedCity;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: Text(
                    'Şehir seçiniz',
                    style: TextStyle(color: Color(0xff11b1719)),
                  ),
                ),

              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.pencilAlt,
                  color: Color(0xff11b719),
                ),
                hintText: 'Acıklama Ekleyiniz',
                //labelText: 'Acıklama Ekleyiniz',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text(
                'Harcamalarım',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              title: Text(
                'Rapor',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              title: Text(
                'Tahmin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Profil',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.grey,
          onPressed: () {}),
    );
  }
}
