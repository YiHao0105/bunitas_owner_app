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
import 'package:get/get.dart';
import 'package:ultimate_salon_owner_flutter/app/util/constance.dart';

class TreatmentCategoriesParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  TreatmentCategoriesParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMySelectedCategory(var body) async {
    var response = await apiService.postPrivate(AppConstants.getMySelectedCategory,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> getSelectedIndividualCategory(var body) async {
    var response = await apiService.postPrivate(AppConstants.getSelectedIndividualCategory,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getId() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  bool getType() {
    return sharedPreferencesManager.getString('type') == 'salon' ? true : false;
  }


}
