import 'package:flutter/material.dart';

class OverviewAlert extends StatelessWidget {
  const OverviewAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromRGBO(49, 50, 55, 1),
        margin: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alerts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).restorablePush(_dialogBuilder);
                      },
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 17,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Heads up. you've used up 90% of your \nShopping budget fot this month.",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.attachment,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Route<Object> _dialogBuilder(BuildContext context, Object arguments) {
    return DialogRoute<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Color.fromRGBO(49, 50, 55, 1),
            content: Container(
              width: 300,
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Heads up. you've used up \n 90% of your Shopping budget \n fot this month.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "DISMISS",
                        style: TextStyle(
                          fontSize: 22,
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
          ),
        );
      },
    );
  }
}
