/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:ultimate_salon_owner_flutter/app/backend/api/api.dart';
import 'package:ultimate_salon_owner_flutter/app/helper/shared_pref.dart';

class TabsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  TabsParser(
      {required this.sharedPreferencesManager, required this.apiService});

  String getName() {
    return sharedPreferencesManager.getString('type') ?? '';
  }
  String getSubType() {
    return sharedPreferencesManager.getString('subType') ?? '';
  }
}
