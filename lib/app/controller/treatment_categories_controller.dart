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
import 'package:ultimate_salon_owner_flutter/app/backend/api/handler.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/models/add_profile_model.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/parse/salon_categories_parse.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/parse/treatment_categories_parse.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/profile_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:ultimate_salon_owner_flutter/app/util/toast.dart';

import 'add_services_controller.dart';

class TreatmentCategoriesController extends GetxController implements GetxService {
  final TreatmentCategoriesParser parser;

  TreatmentCategoriesController({required this.parser});

  bool apiCalled = false;
  List<int> selectedCategories = [];

  String selectedTreatment = '';
  String selectedTreatmentName = '';


  List<AddProfileModel> _selectTreatmentList = <AddProfileModel>[];
  List<AddProfileModel> get selectTreatmentList => _selectTreatmentList;
  bool type = true;
  @override
  void onInit() {
    super.onInit();
    getlist();

    // getMySelectedCategory();
  }

  getlist(){
    type = parser.getType();
    type ? getMySelectedCategory()   :   getSelectedIndividualCategory();

  }


  void saveTreatment(String id) {
    selectedTreatment = id;
    var name = _selectTreatmentList.firstWhere((element) => element.id.toString() == id).name;
    selectedTreatmentName = name as String;
    debugPrint('services selected'+selectedTreatmentName);
    update();
  }

  Future<void> getSelectedIndividualCategory() async {

    print("HellloIndividualCategory===>"+parser.getId());

    var response = await parser.getSelectedIndividualCategory({"id": parser.getId()});
    apiCalled = true;

    print("HellloIndividualCategory===>"+response.bodyString.toString());


    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var cates = myMap['data'];
      _selectTreatmentList = [];
      cates.forEach((data) {
        AddProfileModel datas = AddProfileModel.fromJson(data);
        var index = selectedCategories.indexOf(datas.id as int);
        if (index >= 0) {
          datas.isChecked = true;
        } else {
          datas.isChecked = false;
        }
        _selectTreatmentList.add(datas);
      });

    } else {
      ApiChecker.checkApi(response);
    }
    update();

    update();
  }

  Future<void> getMySelectedCategory() async {

    print("HellloSelectedCategory===>"+parser.getId());

    var response = await parser.getMySelectedCategory({"id": parser.getId()});
    apiCalled = true;

    print("HellloSelectedCategory===>"+response.bodyString.toString());


    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var cates = myMap['data'];
      _selectTreatmentList = [];
      cates.forEach((data) {
        AddProfileModel datas = AddProfileModel.fromJson(data);
        var index = selectedCategories.indexOf(datas.id as int);
        if (index >= 0) {
          datas.isChecked = true;
        } else {
          datas.isChecked = false;
        }
        _selectTreatmentList.add(datas);
      });

    } else {
      ApiChecker.checkApi(response);
    }
    update();

    update();
  }

  Future<void> onSave() async {
    Get.find<AddServicesController>().onSaveTreatment(selectedTreatment,selectedTreatmentName);
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }

  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }
}
