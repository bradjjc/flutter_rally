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
    var chart = PieChart(
        dataMap: list.accounts,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 200.0,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: list.colors,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 10,
        centerText: "ACCOUNTS \n",
        chartValuesOptions: ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          decimalPlaces: 1,
        ),
      );


    return Scaffold(
      body: LayoutBuilder(
          builder: (_, constraints) {
            if (constraints.maxWidth >= 600) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: chart,
                  ),
                  Flexible(
                    flex: 1,
                    child: settings,
                  )
                ],
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: chart,
                      margin: EdgeInsets.symmetric(
                        vertical: 32,
                      ),
                    ),
                    settings,
                  ],
                ),
              );
            }
          },
      ),
    );
  }
}