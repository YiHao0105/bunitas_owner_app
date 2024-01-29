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
import 'package:skeletons/skeletons.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/services_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class ServiceCategoriesScreen extends StatefulWidget {
  const ServiceCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ServiceCategoriesScreen> createState() =>
      _ServiceCategoriesScreenState();
}

class _ServiceCategoriesScreenState extends State<ServiceCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesCategoriesController>(
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
          //     'Select Treatment'.tr,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.start,
          //     style: ThemeProvider.titleStyle,
          //   ),
          // ),
          body: value.apiCalled == false
              ? SkeletonListView()
              : Column(
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
                                    'Select Treatment'.tr,
                                    style: const TextStyle(
                                        color: ThemeProvider.blackColor,
                                        fontSize: 20,
                                        fontFamily: 'bold'),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: value.serviceList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => Column(
                              children: [
                                ListTile(
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  horizontalTitleGap: 0,
                                  leading: Radio(
                                    activeColor: ThemeProvider.appColor,
                                    value: value.serviceList[i].id.toString(),
                                    groupValue: value.selectedService,
                                    onChanged: (data) {
                                      value.saveServices(data.toString());
                                    },
                                  ),
                                  title: Text(
                                      value.serviceList[i].name.toString()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    child: InkWell(
                      onTap: () {
                        value.onSave();
                      },
                      child: Center(
                        child: Text(
                          'Save'.tr,
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
                        value.onBack();
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
