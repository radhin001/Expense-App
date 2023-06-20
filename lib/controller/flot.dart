import 'package:flutter/material.dart';
import 'package:ui_application/controller/provider.dart';
import '../model/variable.dart';
import 'elavitod.dart';

FloatingActionButton newMethod(MyClass1 myprov, BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.black,
    onPressed: () {
      myprov.updateButtonIndex(buttonIndex);
      Dialog errorDialog = Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)), //this right here
        child: SizedBox(
          height: 230,
          width: 302,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Add New Expense',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 238,
                  height: 37,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: reasoncontoller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 188, 188, 188),
                      hintText: 'Reason',
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 188, 188, 188)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31, right: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 37,
                      width: 105,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: amountcontroller,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 188, 188, 188),
                          hintText: 'Amount',
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 37,
                      width: 105,
                      child: GestureDetector(
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),);
                          if (selectedTime != null) {
                            timeController.text = selectedTime.format(context);
                          } },
                        child: AbsorbPointer(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: timeController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 188, 188, 188),
                              hintText: 'Time',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 29, top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 42,
                      width: 100,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 62, 108),
                                fontSize: 15),
                          )),
                    ),
                    SizedBox(
                        height: 42,
                        width: 100,
                        child: Form(
                          child: newMethod2(context),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => errorDialog);
    },
    child: const Icon(
      Icons.add,
      size: 35,
    ),
  );
}