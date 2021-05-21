import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReallyProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
