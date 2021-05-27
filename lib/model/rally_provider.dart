import 'package:flutter/material.dart';

class ReallyProvider extends ChangeNotifier {
  List<Color> colors = [
    Color.fromRGBO(37, 88, 83, 1),
    Color.fromRGBO(29, 70, 59, 1),
    Color.fromRGBO(84, 183, 135, 1),
    Color.fromRGBO(121, 238, 190, 1),
  ];

  List<Color> colorsTwo = [
    Color.fromRGBO(229, 201, 134, 1),
    Color.fromRGBO(205, 108, 85, 1),
    Color.fromRGBO(233, 223, 215, 1),
    Color.fromRGBO(185, 155, 59, 1),
    Color.fromRGBO(241, 193, 39, 1),
  ];

  Map<String, double> accounts = {
    "Checking": 2215.13,
    "Home Savings": 8676.88,
    "Car Savings": 987.48,
    "Vacation": 253.00,
  };

  List<String> accountCard = [
    "*****3456",
    "*****5678",
    "*****9012",
    "*****3454",
  ];

  List<String> accountList = [
    "Checking",
    "Home Savings",
    "Car Savings",
    "Vacation",
  ];

  List<double> accountAmount = [
    2215.13,
    8676.88,
    987.48,
    253.00,
  ];

  Map<String, double> bills = {
    "RedPay Credit": 45.36,
    "Rent": 1200.00,
    "TabFine Credit": 87.33,
    "ABC Loans": 400.00,
    "CBD Loans": 77.4,
  };

  List<String> billsDate = [
    "Jan 29",
    "Feb 9",
    "Feb 22",
    "March 2",
    "March 10",
  ];

  List<String> billsList = [
    "RedPay Credit",
    "Rent",
    "TabFine Credit",
    "ABC Loans",
    "CBD Loans",
  ];

  List<double> billsAmount = [
    45.36,
    1200.00,
    87.33,
    400.00,
    77.4,
  ];
}
