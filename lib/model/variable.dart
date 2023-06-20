import 'package:flutter/material.dart';

int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //Scroll Controller for ListView
  int buttonIndex = 0;
  List<int> expenses = [];
  int total = 0;
  int remainingBalance = 5000;
  final TextEditingController timeController = TextEditingController();
  final TextEditingController reasoncontoller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();