import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:provider/provider.dart';

class OverviewAccount extends StatelessWidget {
  const OverviewAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    return Container(
      child: Card(
        color: Color.fromRGBO(49, 50, 55, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0),
              child: Text(
                "Accounts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              "\$12,132.49",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                height: 4,
                // width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: list.colors,
                  ),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.accountList == null ? 0 : 3,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 10.0, bottom: 10.0),
                            child: Container(
                              color: list.colors[index],
                              width: 5,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 150.0),
                            child: Column(
                              children: [
                                Text(
                                  "${list.accountList[index]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Text(
                                    "${list.accountCard[index]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 1.0),
                            child: Text(
                              "\$ ${list.accountAmount[index]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 1.0),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "SEE ALL",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(49, 50, 55, 1),
                  shadowColor: Color.fromRGBO(49, 50, 55, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
