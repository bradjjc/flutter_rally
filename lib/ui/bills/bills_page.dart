import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({Key key}) : super(key: key);

  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();

    var chart = PieChart(
      dataMap: list.bills,
      animationDuration: Duration(milliseconds: 4000),
      chartLegendSpacing: 16.0,
      chartRadius: MediaQuery.of(context).size.width / 1.2,
      colorList: list.colorsTwo,
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
                            padding: const EdgeInsets.only(top: 150.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Due",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "1,810.09",
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
                                itemCount: list.billsList == null
                                    ? 0
                                    : list.billsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return new GestureDetector(
                                    //You need to make my child interactive
                                    onTap: () => print(list.billsList[index]),
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
                                                color: list.colorsTwo[index],
                                                width: 5,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0, right: 150.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${list.billsList[index]}",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 7.0),
                                                    child: Text(
                                                      "${list.billsDate[index]}",
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
                                                "-\$ ${list.billsAmount[index]}",
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
                                }),
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
