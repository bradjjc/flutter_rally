import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:flutter_rally/ui/accounts/accounts_page.dart';
import 'package:flutter_rally/ui/bills/bills_page.dart';
import 'package:flutter_rally/ui/overview/overview_page.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;



  static const List<Widget> _widgetOptions = <Widget>[
    OverviewPage(),
    AccountsPage(),
    BillsPage(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ReallyProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 38, 46, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 80,
                width: 500,
                child: GNav(
                  mainAxisAlignment: MainAxisAlignment.start,
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 10,
                  activeColor: Colors.white,
                  backgroundColor: Color.fromRGBO(40, 38, 46, 1),
                  iconSize: 24,
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100],
                  color: Colors.white,
                  tabs: [
                    GButton(
                      backgroundColor: Color.fromRGBO(40, 38, 46, 1),
                      icon: Icons.donut_small_outlined,
                      text: 'OVERVIEW',
                    ),
                    GButton(
                      backgroundColor: Color.fromRGBO(40, 38, 46, 1),
                      icon: Icons.attach_money,
                      text: 'ACCOUNTS',
                    ),
                    GButton(
                      backgroundColor: Color.fromRGBO(40, 38, 46, 1),
                      icon: Icons.money_off_rounded,
                      text: 'BILLS',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
