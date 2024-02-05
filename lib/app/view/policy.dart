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
import 'package:ultimate_salon_owner_flutter/app/controller/add_slot_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/policy_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PolicyController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          // appBar: AppBar(
          //   backgroundColor: ThemeProvider.appColor,
          //   iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
          //   centerTitle: true,
          //   elevation: 0,
          //   toolbarHeight: 50,
          //   title: Text(
          //     'Policy'.tr,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.start,
          //     style: ThemeProvider.titleStyle,
          //   ),
          // ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25),
                height: 125.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ThemeProvider.whiteColor,
                        Colors.deepPurple.shade50
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Policy'.tr,
                              style: const TextStyle(
                                  color: ThemeProvider.blackColor,
                                  fontSize: 20,
                                  fontFamily: 'bold'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: ThemeProvider.whiteColor),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Get.back();
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Write your cancellation/Late/No-show/Reschedule Policy.'
                                .tr,
                            style: const TextStyle(
                                fontFamily: 'bold', fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 300,
                              child: TextField(
                                style:
                                    TextStyle(color: ThemeProvider.blackColor),
                                // enabled:  value.content =="null"?true:false,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                // textInputAction: TextInputAction.done,
                                minLines: 10,
                                controller: value.policyTextEditor,
                                maxLines: null,
                                decoration: InputDecoration(
                                  filled: true,
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeProvider.greyColor)),
                                  fillColor: ThemeProvider.whiteColor,
                                  hintText: 'Description'.tr,
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 8.0, top: 14.0, left: 10),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeProvider.appColor),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeProvider.greyColor)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: Visibility(
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 10),
                  //         child: Container(
                  //             width: double.infinity,
                  //             padding:
                  //                 const EdgeInsets.symmetric(vertical: 13.0),
                  //             decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(100.0),
                  //               ),
                  //               color: ThemeProvider.greenColor,
                  //             ),
                  //             child: InkWell(
                  //               onTap: () {
                  //                 value.onSubmit();
                  //               },
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Text(
                  //                     'SUBMIT'.tr,
                  //                     style: const TextStyle(
                  //                         color: ThemeProvider.whiteColor,
                  //                         fontSize: 17),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Visibility(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                    color: ThemeProvider.greenColor,
                  ),
                  child: InkWell(
                    onTap: () {
                      value.onSubmit();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SUBMIT'.tr,
                          style: const TextStyle(
                              color: ThemeProvider.whiteColor, fontSize: 17),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
