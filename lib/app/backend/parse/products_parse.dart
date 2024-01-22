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

class ProductsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductsParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getProductWFreelancer(var body) async {
    var response = await apiService.postPrivate(
        AppConstants.getProductWFreelancer,
        body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> destroyProduct(var body) async {
    var response = await apiService.postPrivate(AppConstants.destroyProduct,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getFreelancerId() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  Future<Response> onUpdateProducts(var body) async {
    var response = await apiService.postPrivate(AppConstants.updateProduct,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getCurrencyCode() {
    return sharedPreferencesManager.getString('currencyCode') ??
        AppConstants.defaultCurrencyCode;
  }

  String getCurrencySide() {
    return sharedPreferencesManager.getString('currencySide') ??
        AppConstants.defaultCurrencySide;
  }

  String getCurrencySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ??
        AppConstants.defaultCurrencySymbol;
  }
}
