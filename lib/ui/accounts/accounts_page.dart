import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key key}) : super(key: key);

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    int key = 0;

    setState(() {
      key = key + 1;
    });

    var chart = PieChart(
      key: ValueKey(key),
      dataMap: list.accounts,
      animationDuration: Duration(milliseconds: 80000),
      chartLegendSpacing: 16.0,
      chartRadius: MediaQuery.of(context).size.width / 1.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 1.2,
      colorList: list.colors,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 8,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: false,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValuesOutside: true,
        showChartValueBackground: true,
        showChartValues: false,
        showChartValuesInPercentage: false,
        decimalPlaces: 2,
      ),
    );

    return Column(
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(
              // height: 400,
              child: LayoutBuilder(builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: chart,
                            margin: EdgeInsets.symmetric(
                              vertical: 22, // 높
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 130.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "12,132.49",
                                      style: TextStyle(
                                        fontSize: 50.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.accountList == null
                                  ? 0
                                  : list.accountList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return new GestureDetector(
                                  //You need to make my child interactive
                                  onTap: () => print(list.accountList[index]),
                                  child: Container(
                                    height: 90,
                                    child: new Card(
                                      //I am the clickable child
                                      color: Color.fromRGBO(49, 50, 55, 1),
                                      margin: EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                top: 10.0,
                                                bottom: 10.0),
                                            child: Container(
                                              color: list.colors[index],
                                              width: 5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, right: 150.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${list.accountList[index]}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 7.0),
                                                  child: Text(
                                                    "${list.accountCard[index]}",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Text(
                                              "\$ ${list.accountAmount[index]}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Tab(
                                              icon: Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
