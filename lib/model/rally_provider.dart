
import 'package:flutter/material.dart';

class ReallyProvider extends ChangeNotifier{

  List<Color> colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];

  Map<String, double> accounts = {
    "Checking": 2215.13,
    "Home Savings": 8676.88,
    "Car Savings": 987.48,
    "Vacation": 253,
  };

  List<String> accountCard = [
    "*****1234",
    "*****5678",
    "*****9012",
    "*****3454",
  ];

  Map<String, double> bills = {
    "RedPay Credit": 45.36,
    "Rent": 1200,
    "TabFine Credit": 87.33,
    "ABC Loans": 400,
    "CBD Loans": 77.4,
  };

  List<String> billsDate = [
    "Jan 29",
    "Feb 9",
    "Feb 22",
    "March 2",
    "March 10",
  ];


}