/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/services_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

import '../controller/profile_categories_controller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesController>(builder: (value) {
      value.selectedTreatment = "";
      return Scaffold(
        backgroundColor: ThemeProvider.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeProvider.appColor,
          iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 50,
          title: Text(
            'Manage Treatments'.tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: ThemeProvider.titleStyle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: ThemeProvider.blackColor,
                  backgroundColor: ThemeProvider.greenColor,
                  textStyle: const TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  value.onAddNew(
                    value.selectedTreatment,value.selectedTreatment_Id
                  );
                },
                child: Text(
                  'Add New'.tr,
                  style: const TextStyle(color: ThemeProvider.whiteColor, fontFamily: 'bold'),
                ),
              ),
            ),
          ],
        ),
        body: value.apiCalled == false
            ? SkeletonListView()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Update Treatment'.tr,
                        style: const TextStyle(fontSize: 17),
                      ),
                      value.type ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: ThemeProvider.appColor, style: BorderStyle.solid),
                          ),
                          child: InkWell(
                            onTap: () {
                              value.onSelectCategories();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(value.profileInfo.webCatesData != null ? value.profileInfo.webCatesData!.length : 0, (index) {
                                      value.selectedTreatment = value.selectedTreatment  + value.profileInfo.webCatesData![index].name.toString() +",";
                                      value.selectedTreatment_Id =value.profileInfo.webCatesData![index].id.toString();
                                      log("Select value is ${value.selectedTreatment} and id is  ${value.selectedTreatment_Id}");
                                      return Column(
                                        children: [
                                          Text(
                                            value.profileInfo.webCatesData![index].name.toString(),
                                            style: const TextStyle(fontSize: 17),
                                          ),
                                          // if (index !=
                                          //     (value.profileInfo.webCatesData!
                                          //             .length -
                                          //         1))
                                          //   const Text(',')
                                        ],
                                      );
                                    }),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: ThemeProvider.greyColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                          :
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: ThemeProvider.appColor,
                                style: BorderStyle.solid),
                          ),
                          child: InkWell(
                            onTap: () {
                              value.voidSelectIndividual();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 11),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      value.individualInfo.webCatesData != null ? value.individualInfo.webCatesData!.length : 0, (index){
                                      value.selectedTreatment = value.selectedTreatment  + value.individualInfo.webCatesData![index].name.toString() +",";
                                      value.selectedTreatment_Id =value.individualInfo.webCatesData![index].id.toString();
                                      log("Select value is ${value.selectedTreatment} and id is  ${value.selectedTreatment_Id}");
                                        return Column(
                                          children: [
                                            Text(
                                              value.individualInfo
                                                  .webCatesData![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 17),
                                            ),
                                          ],
                                        );
                                    }
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: ThemeProvider.greyColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey,
                        height: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Treatments services'.tr,
                        style: const TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: value.servicesList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) => Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ThemeProvider.whiteColor,
                                boxShadow: const [
                                  BoxShadow(color: ThemeProvider.greyColor, blurRadius: 5.0, offset: Offset(0.7, 2.0)),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(40),
                                          child: FadeInImage(
                                            image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.servicesList[i].cover}'),
                                            placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/notfound.png',
                                                fit: BoxFit.cover,
                                                height: 40,
                                                width: 40,
                                              );
                                            },
                                            fit: BoxFit.cover,
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: ThemeProvider.blackColor.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${value.servicesList[i].discount.toString()} %',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 10, color: ThemeProvider.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              value.servicesList[i].name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontFamily: 'bold', fontSize: 14),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      value.updateStatus(value.servicesList[i].id as int, value.servicesList[i].status as int);
                                                    },
                                                    child: Icon(
                                                      value.servicesList[i].status == 1 ? Icons.visibility : Icons.visibility_off,
                                                      color: value.servicesList[i].status == 1 ? ThemeProvider.greenColor : ThemeProvider.blackColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  InkWell(
                                                    onTap: () {
                                                      value.onEdit(value.servicesList[i].id as int);
                                                    },
                                                    child: const Icon(
                                                      Icons.edit_note,
                                                      color: ThemeProvider.appColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            contentPadding: const EdgeInsets.all(20),
                                                            content: SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/delete.png',
                                                                    fit: BoxFit.cover,
                                                                    height: 80,
                                                                    width: 80,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Text(
                                                                    'Are you sure'.tr,
                                                                    style: const TextStyle(fontSize: 24, fontFamily: 'semi-bold'),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text('to delete Slots ?'.tr),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child: ElevatedButton(
                                                                          onPressed: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            foregroundColor: ThemeProvider.backgroundColor,
                                                                            backgroundColor: ThemeProvider.redColor,
                                                                            minimumSize: const Size.fromHeight(35),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                          ),
                                                                          child: Text(
                                                                            'Cancel'.tr,
                                                                            style: const TextStyle(
                                                                              color: ThemeProvider.whiteColor,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 20,
                                                                      ),
                                                                      Expanded(
                                                                        child: ElevatedButton(
                                                                          onPressed: () {
                                                                            value.onDestroy(value.servicesList[i].id as int);
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            foregroundColor: ThemeProvider.backgroundColor,
                                                                            backgroundColor: ThemeProvider.greenColor,
                                                                            minimumSize: const Size.fromHeight(35),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                          ),
                                                                          child: Text(
                                                                            'Delete'.tr,
                                                                            style: const TextStyle(
                                                                              color: ThemeProvider.whiteColor,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      size: 20,
                                                      color: ThemeProvider.redColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            value.servicesList[i].webCatesData == null ? "" :value.servicesList[i].webCatesData!.name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(color: ThemeProvider.greyColor, fontSize: 12),
                                        ),
                                        const SizedBox(height: 2),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              value.servicesList[i].discount != 0.0  ?
                                              TextSpan(
                                                text: value.currencySide == 'left' ? '${Get.find<ServicesController>().currencySymbol}${value.servicesList[i].price}' : '  ${value.servicesList[i].price}${Get.find<ServicesController>().currencySymbol}',
                                                style: const TextStyle(fontSize: 12, color: ThemeProvider.greyColor, decoration: TextDecoration.lineThrough),
                                              ) :
                                              TextSpan(
                                                text: value.currencySide == 'left' ? '${Get.find<ServicesController>().currencySymbol}${value.servicesList[i].price}' : '  ${value.servicesList[i].price}${Get.find<ServicesController>().currencySymbol}',
                                                style: const TextStyle(fontSize: 12, color: ThemeProvider.greenColor, fontFamily: 'bold'),
                                              )
                                              ,
                                              TextSpan(text: '   '),

                                              TextSpan(
                                                text: value.servicesList[i].discount != 0.0  ?  Get.find<ServicesController>().currencySide == 'left' ? '${Get.find<ServicesController>().currencySymbol}${value.servicesList[i].off}' : '  ${value.servicesList[i].off}${Get.find<ServicesController>().currencySymbol}' : '',
                                                style: const TextStyle(fontSize: 12, color: ThemeProvider.greenColor, fontFamily: 'bold'),
                                              ) ,
                                            ],
                                          ),
                                        ),
                                        Text(
                                          value.durationValue(value.servicesList[i].duration.toString()),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(color: ThemeProvider.greyColor, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}

