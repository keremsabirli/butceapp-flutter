import 'package:butceappflutter/widgets/my_app_bar.dart';
import 'package:butceappflutter/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ExpenseAddScreen extends StatefulWidget {
  @override
  _ExpenseAddScreenState createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  final _formKey = GlobalKey<FormState>();
  var selectedCategory;
  var selectedShop;
  var selectedCity;
  var selectedType;
  List<String> _accountType = <String>[
    'Nakit',
    'Kredi Kartı',
    'Çek'
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
    'A-101',
    'Şok',
    'MAVİ',
    'Shell'
  ];
  List<String> _cities = <String>['Adana', 'Adıyaman', 'Afyon', 'Ağrı', 'Amasya', 'Ankara', 'Antalya', 'Artvin',
'Aydın', 'Balıkesir', 'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Çanakkale',
'Çankırı', 'Çorum', 'Denizli', 'Diyarbakır', 'Edirne', 'Elazığ', 'Erzincan', 'Erzurum', 'Eskişehir',
'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkari', 'Hatay', 'Isparta', 'Mersin', 'İstanbul', 'İzmir', 
'Kars', 'Kastamonu', 'Kayseri', 'Kırklareli', 'Kırşehir', 'Kocaeli', 'Konya', 'Kütahya', 'Malatya', 
'Manisa', 'Kahramanmaraş', 'Mardin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu', 'Rize', 'Sakarya',
'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Şanlıurfa', 'Uşak',
'Van', 'Yozgat', 'Zonguldak', 'Aksaray', 'Bayburt', 'Karaman', 'Kırıkkale', 'Batman', 'Şırnak',
'Bartın', 'Ardahan', 'Iğdır', 'Yalova', 'Karabük', 'Kilis', 'Osmaniye', 'Düzce'
  ];
  DateTime _currentdate =new DateTime.now();
  Future<Null> _selectDate(BuildContext context)async{
    final DateTime _seldate  = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2022),
        builder: (context,child){
          return SingleChildScrollView(child:child,);
        }
    );
  }
  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Harcama Ekle",
              style: TextStyle(
                color: Theme.of(context).accentColor,
              )),
        ),
        actions: <Widget>[
          IconButton(onPressed: (){
            _selectDate(context);
          },
            icon: Icon(
              Icons.date_range,
              color: Theme.of(context).accentColor,
            ),
          )
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
                  color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 25.0,
                ),
                new DropdownButton(
                  hint: Text('Mağaza'),
                  value: selectedShop,
                  onChanged: (newValue){
                    setState(() {
                      selectedShop=newValue;
                    });
                  },
                  items: _shops.map((shop) {
                    return DropdownMenuItem(
                      child: new Text(shop),
                      value: shop,
                    );
                  }).toList(),
                ),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.coins,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: 'Tutar',
              ),
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
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 25.0,
                ),
                new DropdownButton(
                  hint: Text('Ödeme Şekli'),
                  value: selectedType,
                  onChanged: (newValue){
                    setState(() {
                      selectedType=newValue;
                    });
                  },
                  items: _accountType.map((type) {
                    return DropdownMenuItem(
                      child: new Text(type),
                      value: type,
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
                  FontAwesomeIcons.userCircle, //coins
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
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
                    'Kişi',
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
                  FontAwesomeIcons.shoppingBag, //coins
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 25.0,
                ),
                new DropdownButton(
                  hint: Text('Şehir'),
                  value: selectedCity,
                  onChanged: (newValue){
                    setState(() {
                      selectedCity=newValue;
                    });
                  },
                  items: _cities.map((city) {
                    return DropdownMenuItem(
                      child: new Text(city),
                      value: city,
                    );
                  }).toList(),
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.pencilAlt,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: 'Açıklama',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                child: Text('Ekle'),
                onPressed: () {

                }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey),
        child: MyBottomNavigationBar()
      ),
    );
  }
}
