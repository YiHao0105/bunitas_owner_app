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
import 'package:ultimate_salon_owner_flutter/app/controller/languages_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/constance.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguagesController>(
      builder: (value) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: ThemeProvider.appColor,
          //   elevation: 0,
          //   centerTitle: false,
          //   automaticallyImplyLeading: true,
          //   title: Text('Languages'.tr, style: ThemeProvider.titleStyle),
          //   leading: IconButton(
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: ThemeProvider.whiteColor,
          //     ),
          //     onPressed: () {
          //       Get.back();
          //     },
          //   ),
          // ),
          body: Column(
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
                              'Languages'.tr,
                              style: const TextStyle(
                                  color: ThemeProvider.blackColor,
                                  fontSize: 20,
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
              Expanded(
                child: ListView(children: [
                  for (var language in AppConstants.languages)
                    ListTile(
                      title: Text(language.languageName),
                      leading: Radio(
                          value: language.languageCode,
                          groupValue: value.languageCode,
                          onChanged: (e) {
                            value.saveLanguages(e.toString());
                          }),
                    )
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
