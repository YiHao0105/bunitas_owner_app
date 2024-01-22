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
import 'package:skeletons/skeletons.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/salon_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/treatment_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class TreatmentCategoriesScreen extends StatefulWidget {
  const TreatmentCategoriesScreen({Key? key}) : super(key: key);


  @override
  State<TreatmentCategoriesScreen> createState() => _TreatmentCategoriesScreen();
}



class _TreatmentCategoriesScreen extends State<TreatmentCategoriesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<TreatmentCategoriesController>().getlist();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TreatmentCategoriesController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 50,
            title: Text(
              'Select Treatment'.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: ThemeProvider.titleStyle,
            ),
          ),
          body: value.apiCalled == false
              ? SkeletonListView()
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.selectTreatmentList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => Column(
                      children: [
                        ListTile(
                          visualDensity:
                          const VisualDensity(vertical: -4),
                          horizontalTitleGap: 0,
                          leading: Radio(
                            activeColor: ThemeProvider.appColor,
                            value: value.selectTreatmentList[i].id.toString(),
                            groupValue: value.selectedTreatment,
                            onChanged: (data) {
                              value.saveTreatment(data.toString());
                            },
                          ),
                          title:
                          Text(value.selectTreatmentList[i].name.toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeProvider.greenColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        value.onSave();
                      },
                      child: Center(
                        child: Text(
                          'Save'.tr,
                          style: const TextStyle(
                              fontFamily: 'bold',
                              color: ThemeProvider.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeProvider.redColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        value.onBack();
                      },
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
