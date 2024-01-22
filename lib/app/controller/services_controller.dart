/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/api/handler.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/models/services_model.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/parse/services_parse.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/add_services_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/profile_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/salon_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/helper/router.dart';
import 'package:ultimate_salon_owner_flutter/app/util/constance.dart';
import 'package:ultimate_salon_owner_flutter/app/util/toast.dart';

import '../backend/models/individual_model.dart';
import '../backend/models/profile_model.dart';
import '../backend/models/timing_model.dart';
import '../backend/parse/profile_categories_parser.dart';
import 'individual_categories_controller.dart';

class ServicesController extends GetxController implements GetxService {
  final ServicesParser parser;

  String title = 'Services';
  String selectedTreatment = '';
  String selectedTreatment_Id ="1";
  

  List<ServicesModel> _servicesList = <ServicesModel>[];

  List<ServicesModel> get servicesList => _servicesList;

  String currencySide = AppConstants.defaultCurrencySide;
  String currencySymbol = AppConstants.defaultCurrencySymbol;

  bool apiCalled = false;

  ProfileModel _profileInfo = ProfileModel();

  ProfileModel get profileInfo => _profileInfo;

  List<TimingModel> _timesList = <TimingModel>[];

  List<TimingModel> get timesList => _timesList;

  ServicesController({required this.parser});

  IndividualInfoModel _individualInfo = IndividualInfoModel();

  IndividualInfoModel get individualInfo => _individualInfo;

  bool type = true;

  @override
  void onInit() {
    super.onInit();
    type = parser.getType();
    getServices();
    type ?   getCateById() : getIndividualCateById();
    currencySide = parser.getCurrencySide();
    currencySymbol = parser.getCurrencySymbol();
  }


  Future<void> getIndividualCateById() async {
    var response = await parser.getIndividualById();
    apiCalled = true;
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());
      _timesList = [];
      var data = myMap['data'];
      IndividualInfoModel invidualData = IndividualInfoModel.fromJson(data);
      _individualInfo = invidualData;

      if (individualInfo.timing != 'NA') {
        var times = jsonDecode(individualInfo.timing.toString());
        times.forEach((element) {
          TimingModel datas = TimingModel.fromJson(element);
          _timesList.add(datas);
        });
      }
      parser.saveId(individualInfo.id.toString());
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getCateById() async {
    var response = await parser.getCateById();
    apiCalled = true;
    print("HelloCategory===>"+response.bodyString.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());

      var data = myMap['data'];
      ProfileModel profileData = ProfileModel.fromJson(data);
      _profileInfo = profileData;

      if (profileInfo.timing != 'NA') {
        var times = jsonDecode(profileInfo.timing.toString());
        times.forEach((element) {
          TimingModel datas = TimingModel.fromJson(element);
          _timesList.add(datas);
        });
      }

      parser.saveId(profileInfo.id.toString());
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  // void onSelectCategories() {
  //   Get.delete<SalonCategoriesController>(force: true);
  //   Get.toNamed(AppRouter.getSalonCategoriesRoute(),
  //       arguments: [profileInfo.categories]);
  // }

  Future<void> getServices() async {
    var response = await parser
        .getServices({"id": parser.sharedPreferencesManager.getString('uid')});
    apiCalled = true;

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var body = myMap['data'];
      _servicesList = [];
      body.forEach((element) {
        ServicesModel service = ServicesModel.fromJson(element);
        _servicesList.add(service);
      });
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }



  durationValue(String text)  {
    String durationValue = "";
    List<String> words = text.split(".");
    if(words.length == 2){
      if(words[0].toString() == '0'){
        durationValue = "30min";
      }else{
        if(words[1].toString() == '0'){
          durationValue = words[0].toString()+"h";
        }else{
          durationValue = words[0].toString()+"h "+"30min";
        }
      }
    }else{
      durationValue = words[0].toString()+"h";
    }
    print("helloString====>"+durationValue);
    return durationValue.toString();
  }

  Future<void> updateStatus(int id, int status) async {
    var body = {"status": status == 1 ? 0 : 1, "id": id};
    var response = await parser.onUpdateServices(body);
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      successToast('Updated');
      getServices();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  void onAddNew(String treatmentSelected,String selectedTreatment_Id) {
    Get.delete<AddServicesController>(force: true);
    Get.toNamed(AppRouter.getAddServicesRoute(),
        arguments: ['new', treatmentSelected,selectedTreatment_Id]);
  }

  void onEdit(int id) {
    Get.delete<AddServicesController>(force: true);
    Get.toNamed(AppRouter.getAddServicesRoute(), arguments: ['edit', id,"",""]);
  }

  void onDestroy(int id) async {
    var param = {"id": id};
    debugPrint('id ---> $id');
    var response = await parser.servicesDestroy(param);
    if (response.statusCode == 200) {
      getServices();
      showToast('item remove successfully');
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  voidSelectIndividual(){
    // Get.delete<IndividualprofileCategoriesController>(force: true);
    Get.toNamed(AppRouter.getIndividualProfileCategoriesRoute(),
        arguments: [individualInfo.categories])!.then((value) {
      getServices();
      getIndividualCateById();
    });
  }


  void onSelectCategories() {
    Get.delete<SalonCategoriesController>(force: true);
    Get.toNamed(AppRouter.getSalonCategoriesRoute(),
        arguments: [profileInfo.categories])!.then((value) {
      getServices();
      getCateById();
    });
  }
}
