/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/add_timing_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class AddTimingScreen extends StatefulWidget {
  const AddTimingScreen({Key? key}) : super(key: key);

  @override
  State<AddTimingScreen> createState() => _AddTimingScreenState();
}

class _AddTimingScreenState extends State<AddTimingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTimingController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          // appBar: AppBar(
          //   backgroundColor: ThemeProvider.appColor,
          //   iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
          //   centerTitle: true,
          //   elevation: 0,
          //   toolbarHeight: 50,
          //   title: Text(
          //     'Add Timing'.tr,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.start,
          //     style: ThemeProvider.titleStyle,
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25),
                  height: 125.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ThemeProvider.whiteColor,
                          Colors.deepPurple.shade50
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add Opening Date/Hour'.tr,
                                style: const TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: 18,
                                    fontFamily: 'bold'),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ThemeProvider.whiteColor),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                              color: ThemeProvider.appColor,
                              style: BorderStyle.solid),
                        ),
                        child: DropdownButton<String>(
                          value: value.dayName,
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more),
                          elevation: 16,
                          style: const TextStyle(color: ThemeProvider.appColor),
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            debugPrint(newValue);
                            value.onUpdateDayName(newValue.toString());
                          },
                          items: <String>[
                            'Sunday'.tr,
                            'Monday'.tr,
                            'Tuesday'.tr,
                            'Wednesday'.tr,
                            'Thursday'.tr,
                            'Friday'.tr,
                            'Saturday'.tr
                          ].map<DropdownMenuItem<String>>((String selected) {
                            return DropdownMenuItem<String>(
                              value: selected,
                              child: Text(selected),
                            );
                          }).toList(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.openTimePicker();
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                                color: ThemeProvider.appColor,
                                style: BorderStyle.solid),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              value.openTime == ''
                                  ? Text('Open Time'.tr)
                                  : Text(value.openTime.toString()),
                              const Icon(Icons.expand_more),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.closeTimePicker();
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                                color: ThemeProvider.appColor,
                                style: BorderStyle.solid),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              value.closeTime == ''
                                  ? Text('Close Time'.tr)
                                  : Text(value.closeTime.toString()),
                              const Icon(Icons.expand_more),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeProvider.greenColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: value.action == 'new'
                        ? InkWell(
                            onTap: () {
                              value.onSaveTime();
                            },
                            child: Center(
                              child: Text(
                                'Save'.tr,
                                style: const TextStyle(
                                    fontFamily: 'bold',
                                    color: ThemeProvider.whiteColor),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              value.onUpdateTime();
                            },
                            child: Center(
                              child: Text(
                                'Update'.tr,
                                style: const TextStyle(
                                    fontFamily: 'bold',
                                    color: ThemeProvider.whiteColor),
                              ),
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeProvider.redColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        //
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Cancel'.tr,
                          style: const TextStyle(
                              fontFamily: 'bold',
                              color: ThemeProvider.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
