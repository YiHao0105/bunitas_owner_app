/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/salon_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class SalonCategoriesScreen extends StatefulWidget {
  const SalonCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SalonCategoriesScreen> createState() => _SalonCategoriesScreen();
}

class _SalonCategoriesScreen extends State<SalonCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalonCategoriesController>(
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
          //     'Select Salon Categories'.tr,
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
                                  'Select Salon Categories'.tr,
                                  style: const TextStyle(
                                      color: ThemeProvider.blackColor,
                                      fontSize: 20,
                                      fontFamily: 'bold'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, left: 8.0),
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
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              for (var item in value.selectEditProfileList)
                                CheckboxListTile(
                                  title: Text(item.name.toString()),
                                  checkColor: Colors.white,
                                  activeColor: ThemeProvider.appColor,
                                  value: item.isChecked,
                                  onChanged: (status) {
                                    value.updateStatus(
                                        status!, item.id as int);
                                  },
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
                  child: GestureDetector(
                    onTap: () {
                      value.updateCate();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ThemeProvider.greenColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
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
                  child: GestureDetector(
                    onTap: () {
                      value.onBack();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ThemeProvider.redColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
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
