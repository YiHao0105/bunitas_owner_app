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
import 'package:ultimate_salon_owner_flutter/app/backend/parse/tabs_parse.dart';

class TabsController extends GetxController with GetTickerProviderStateMixin implements GetxService {
  final TabsParser parser;
  int tabId = 0;
  late TabController tabController;
  TabsController({required this.parser});
  String subType = "";

  @override
  void onInit() {

    super.onInit();
    subType = parser.getSubType();
    if (subType == "Products Only"){
      tabController = TabController(length: 5, vsync: this, initialIndex: tabId);
    }else{
      tabController = TabController(length: 6, vsync: this, initialIndex: tabId);
    }
  }

  void cleanLoginCreds() {
    // parser.cleanData();
  }

  void updateTabId(int id) {
    tabId = id;

    tabController.animateTo(tabId);
    update();
  }
}
