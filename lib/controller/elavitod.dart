import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_application/controller/provider.dart';
import 'package:ui_application/model/variable.dart';
import '../model/list.dart';
import '../view/callender.dart';

ElevatedButton newMethod2(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        reason.add(reasoncontoller.text);
        savereason(reason,
            key: DateFormat("yyyy-MM-dd").format(selectedDate).toString());
        amount.add(amountcontroller.text);
        saveamount(amount,
            key: '${DateFormat("yyyy-MM-dd").format(selectedDate)}Amount');
        time.add(timeController.text);
        savetime(time,
            key: '${DateFormat("yyyy-MM-dd").format(selectedDate)}Time');
        List<int> amountint = amount.map((str) => int.parse(str)).toList();
        total = amountint.reduce((a, b) => a + b);
        List<Map<String, dynamic>> expenses = [];
        for (int i = 0; i < reason.length; i++) {
          expenses
              .add({'Amount': amount[i], 'Reason': reason[i], 'Time': time[i]});
        }
        expenses.sort((a, b) => DateFormat("h:mm a")
            .parse(a['time'])
            .compareTo(DateFormat("h:mm a").parse(b['time'])));
        amount = [];
        reason = [];
        time = [];
        for (int i = 0; i < expenses.length; i++) {
          amount.add(expenses[i]['amount']);
          reason.add(expenses[i]['reason']);
          time.add(expenses[i]['time']);
        }
      },
      child: const Text(
        'Add',
        selectionColor: Color.fromARGB(255, 6, 62, 108),
        style: TextStyle(color: Colors.white, fontSize: 15),
      ));
}
