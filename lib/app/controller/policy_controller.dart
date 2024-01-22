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
import 'package:ultimate_salon_owner_flutter/app/backend/parse/policy_parse.dart';
import 'package:ultimate_salon_owner_flutter/app/util/toast.dart';

import '../backend/api/handler.dart';
import '../util/theme.dart';

class PolicyController extends GetxController implements GetxService {
  final PolicyParser parser;
  String content = '';
  bool apiCalled = false;
  final policyTextEditor = TextEditingController();

  PolicyController({required this.parser});

  @override
  void onInit() {
    getPolicyDetails();
    super.onInit();
  }

  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }

  Future<void> getPolicyDetails() async {
    Response response = await parser.getPolicyDetails();

    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      //  if (body['content'] != '' && body['content'] != null) {
      content = body;
      //content ="daada";
      if (content != "null") {
        policyTextEditor.text = content.toString();
      }
      else
        {
          policyTextEditor.text="";
        }
      //}
      update();
    } else {
      ApiChecker.checkApi(response);
      update();
    }
  }

  Future<void> onSubmit() async {
    if (policyTextEditor.text == '' || policyTextEditor.text.isEmpty) {
      showToast('All fields are required'.tr);
      return;
    }

    var body = {
      "id": parser.getUID(),
      "policy": policyTextEditor.text.toString(),
    };

    Get.dialog(
      SimpleDialog(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              const CircularProgressIndicator(
                color: ThemeProvider.appColor,
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                  child: Text(
                "Please wait".tr,
                style: const TextStyle(fontFamily: 'bold'),
              )),
            ],
          )
        ],
      ),
      barrierDismissible: false,
    );
    var response = await parser.updatePolicy(body);

    Get.back();
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      showToast(myMap['message'].toString());
      policyTextEditor.text = "";
      update();
    } else if (response.statusCode == 401) {
      showToast(response.bodyString.toString());
      update();
    } else if (response.statusCode == 404) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      showToast(myMap['message'].toString());
      update();
    } else {
      ApiChecker.checkApi(response);
      update();
    }
  }
}
