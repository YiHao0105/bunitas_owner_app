/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/api/api.dart';
import 'package:ultimate_salon_owner_flutter/app/helper/shared_pref.dart';

import '../../util/constance.dart';

class PolicyParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  PolicyParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> updatePolicy(var body) async {
    var response = await apiService.postPrivate(AppConstants.updatePolicy, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> getPolicyDetails() async {
    var response = await apiService.postPrivate(AppConstants.getPolicy, {'id': sharedPreferencesManager.getString('saloonId')}, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  // Future<Response> updatePolicy(dynamic body) async {
  //   var response = await apiService.postPrivate(
  //       AppConstants.updatePolicy,
  //       sharedPreferencesManager.getString('token').toString() ?? '',
  //       body);
  //   return response;
  // }

  String getUID() {
    log("Get user id is ${sharedPreferencesManager.getString('saloonId') ?? '0'}");
    return sharedPreferencesManager.getString('saloonId') ?? '0';
  }

  // String getSaloon() {
  //   return sharedPreferencesManager.getString('uid') ?? '0';
  // }
}
