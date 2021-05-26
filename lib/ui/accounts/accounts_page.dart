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
      animationDuration: Duration(milliseconds: 100000),
      chartLegendSpacing: 16.0,
      chartRadius: MediaQuery.of(context).size.width / 1.4,
      colorList: list.colors,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 10,
      centerText: "ACCOUNTS \n",
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
        decimalPlaces: 1,
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
          height: 400,
          child: LayoutBuilder(
              builder: (_, constraints) {
                if (constraints.maxWidth >= 600) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: chart,
                      ),
                      Flexible(
                        flex: 1,
                        // child: settings,
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
                            vertical: 22, // 높
                          ),
                        ),
                        // settings,
                      ],
                    ),
                  );
                }
              },

          ),
          ),
          ],
        ),
      ],
    );
  }
}