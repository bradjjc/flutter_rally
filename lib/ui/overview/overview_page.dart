import 'package:flutter/material.dart';
import 'package:flutter_rally/model/rally_provider.dart';
import 'package:flutter_rally/ui/overview/overview_detail/overview_account.dart';
import 'package:flutter_rally/ui/overview/overview_detail/overview_alert.dart';
import 'package:flutter_rally/ui/overview/overview_detail/overview_bills.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<ReallyProvider>();
    return Column(
      children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OverviewAlert(),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OverviewAccount(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OverviewBills(),
        ),
      ],
    );
  }
  }

