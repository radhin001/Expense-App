import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_application/controller/provider.dart';
import 'package:ui_application/model/variable.dart';
import '../controller/flot.dart';
import '../model/list.dart';

DateTime selectedDate = DateTime.utc(2023, 1, 1);

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyClass>(context, listen: false);
    final myprov = Provider.of<MyClass1>(
      context,
    );
    return Consumer<MyClass>(builder: (context, abc1, child) {
      abc1.reason1();
      abc1.amount1();
      abc1.time1();

      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  )),
              SizedBox(
                  height: 90,
                  width: 370,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 20);
                    },
                    itemCount: 365,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          myprov.updateButtonIndex(index);
                          buttonIndex = index;
                          print(reason);
                          currentDateSelectedIndex = index;
                          selectedDate = DateTime.utc(2023, 1, 1)
                              .add(Duration(days: index));
                          reason.clear();
                          provider.reason1();
                          amount.clear();
                          provider.amount1();
                          time.clear();
                          provider.time1();
                          reason.clear();
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(3, 3),
                                        blurRadius: 5)
                                  ],
                                  color: currentDateSelectedIndex == index
                                      ? const Color.fromARGB(255, 23, 117, 194)
                                      : const Color.fromARGB(
                                          255, 203, 195, 195)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    DateTime.utc(2023, 1, 1)
                                        .add(Duration(days: index))
                                        .day
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: currentDateSelectedIndex == index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              listOfDays[DateTime.utc(2023, 1, 1)
                                          .add(Duration(days: index))
                                          .weekday -
                                      1]
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
              Container(
                height: 60,
                width: 370,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Remaining Balance : ' '${remainingBalance - total}'),
                    Text('Expense : ' '$total'),
                  ],
                ),
              ),
              Container(
                height: 523,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: reason.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 80,
                            width: 370,
                            decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 290,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                          height: 25,
                                          width: 50,
                                          child: Icon(Icons.restore)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            reason[index],
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          Text(time[index]),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.transparent,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '₹ ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      Text(
                                        amount[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
          floatingActionButton: newMethod(myprov, context),
        ),
      );
    });
  }
}
