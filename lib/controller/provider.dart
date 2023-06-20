import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/list.dart';
import '../view/callender.dart';

Future<List<String>?> getreason1(key) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.getStringList(key);
}

Future<List<String>?> getamount2(key) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.getStringList(key + 'amount');
}

Future<List<String>?> gettime3(key) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.getStringList(key + 'time');
}

Future<Future<bool>> savereason(List<String> reason, {String? key}) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.setStringList(key!, reason);
}

Future<Future<bool>> saveamount(List<String> amount, {String? key}) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.setStringList('${key!}amount', amount);
}

Future<Future<bool>> savetime(List<String> time, {String? key}) async {
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.setStringList('${key!}time', time);
}

class MyClass with ChangeNotifier {
  int currentDateSelectedIndex = 0;
  reason1() async {
    await getreason1(DateFormat("yyyy-MM-dd").format(selectedDate).toString())
        .then((value) {
      reason = value!;
    });
    notifyListeners();
  }
  amount1() async {
    await getamount2('${DateFormat("yyyy-MM-dd").format(selectedDate)}Amount')
        .then((value1) {
      amount = value1!;
    });
    notifyListeners();
  }
  time1() async {
    await gettime3('${DateFormat("yyyy-MM-dd").format(selectedDate)}Time')
        .then((value2) {
      time = value2!;
    });
    notifyListeners();
  }
}
class MyClass1 extends ChangeNotifier{
int buttonindex = 0;
  void updateButtonIndex(int index) {
    buttonindex = index;
    notifyListeners();
  }
}