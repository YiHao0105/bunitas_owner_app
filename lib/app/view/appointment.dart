/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/appointment_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:ultimate_salon_owner_flutter/app/view/inbox.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
      builder: (value) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: ThemeProvider.whiteColor,
              // appBar: AppBar(
              //     automaticallyImplyLeading: false,
              //     backgroundColor: ThemeProvider.appColor,
              //     elevation: 0,
              //     iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
              //     title: Text(
              //       'Appointments History'.tr,
              //       style: ThemeProvider.titleStyle,
              //     ),
              //     bottom: TabBar(
              //       controller: value.tabController,
              //       unselectedLabelColor: ThemeProvider.blackColor,
              //       labelColor: ThemeProvider.whiteColor,
              //       indicatorColor: ThemeProvider.whiteColor,
              //       labelStyle: const TextStyle(
              //           fontFamily: 'medium',
              //           fontSize: 16,
              //           color: ThemeProvider.whiteColor),
              //       unselectedLabelStyle: const TextStyle(
              //           fontFamily: 'medium',
              //           fontSize: 16,
              //           color: ThemeProvider.whiteColor),
              //       indicatorSize: TabBarIndicatorSize.tab,
              //       labelPadding: const EdgeInsets.all(8),
              //       tabs: [
              //         Text(
              //           'New'.tr,
              //           style: const TextStyle(color: ThemeProvider.whiteColor),
              //         ),
              //         Text(
              //           'Old'.tr,
              //           style: const TextStyle(color: ThemeProvider.whiteColor),
              //         ),
              //       ],
              //     )),
              body: value.apiCalled == false
                  ? SkeletonListView()
                  : Stack(
                      children: [
                        Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Appointment History'.tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.blackColor,
                                                fontSize: 20,
                                                fontFamily: 'bold'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      ThemeProvider.whiteColor),
                                              child: IconButton(
                                                icon: Icon(CupertinoIcons
                                                    .bubble_middle_bottom),
                                                onPressed: () {
                                                  Get.to(InboxScreen());
                                                },
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: TabBarView(
                                  controller: value.tabController,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: value.appointmentList.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: List.generate(
                                                value.appointmentList.length,
                                                (index) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Banner(
                                                      message: value
                                                          .statusName[value
                                                              .appointmentList[
                                                                  index]
                                                              .status as int]
                                                          .tr,
                                                      color: value
                                                                  .statusName[value
                                                                          .appointmentListOld[
                                                                              index]
                                                                          .status
                                                                      as int]
                                                                  .tr ==
                                                              "Accepted".tr
                                                          ? ThemeProvider
                                                              .greenColor
                                                          : value
                                                                      .statusName[
                                                                          value.appointmentListOld[index].status
                                                                              as int]
                                                                      .tr ==
                                                                  "Ongoing".tr
                                                              ? ThemeProvider
                                                                  .orangeColor
                                                              : value.statusName[value.appointmentListOld[index].status as int].tr ==
                                                                      "Completed"
                                                                          .tr
                                                                  ? ThemeProvider
                                                                      .purpleColor
                                                                  : value.statusName[value.appointmentListOld[index].status as int].tr ==
                                                                          "Delayed"
                                                                              .tr
                                                                      ? ThemeProvider
                                                                          .yellowColor
                                                                      : value.statusName[value.appointmentListOld[index].status as int].tr == "Rejected".tr
                                                                          ? ThemeProvider.redColor
                                                                          : ThemeProvider.appColor,
                                                      location: BannerLocation
                                                          .topStart,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: ThemeProvider
                                                              .whiteColor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: ThemeProvider
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 35.0,
                                                            ),
                                                          ],
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            value.onAppointment(
                                                                value
                                                                    .appointmentList[
                                                                        index]
                                                                    .id as int);
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            5),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: SizedBox
                                                                          .fromSize(
                                                                        size: const Size
                                                                            .fromRadius(
                                                                            25),
                                                                        child:
                                                                            FadeInImage(
                                                                          image:
                                                                              NetworkImage('${Environments.apiBaseURL}storage/images/${value.appointmentList[index].userInfo!.cover.toString()}'),
                                                                          placeholder:
                                                                              const AssetImage("assets/images/placeholder.jpeg"),
                                                                          imageErrorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                            return Image.asset(
                                                                              'assets/images/notfound.png',
                                                                              fit: BoxFit.cover,
                                                                              height: 25,
                                                                              width: 25,
                                                                            );
                                                                          },
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              25,
                                                                          width:
                                                                              25,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '${value.appointmentList[index].userInfo!.firstName} ${value.appointmentList[index].userInfo!.lastName}',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontFamily: 'bold',
                                                                              fontSize: 12,
                                                                              color: ThemeProvider.blackColor),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                value.appointmentList[index].appointmentsTo == 1 ? '${value.appointmentList[index].address!.house} ${value.appointmentList[index].address!.address} ${value.appointmentList[index].address!.landmark} ${value.appointmentList[index].address!.pincode}' : 'At Salon'.tr,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                maxLines: 2,
                                                                                style: const TextStyle(fontSize: 11, color: ThemeProvider.blackColor),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "Appointments ID #".tr +
                                                                              value.appointmentList[index].id.toString(),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontSize: 12,
                                                                              color: ThemeProvider.blackColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 1,
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  border:
                                                                      Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color: ThemeProvider
                                                                          .backgroundColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  value
                                                                          .appointmentList[
                                                                              index]
                                                                          .items!
                                                                          .services!
                                                                          .isNotEmpty
                                                                      ? Text(
                                                                          'Treatment(s)'
                                                                              .tr,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontFamily: 'bold',
                                                                              fontSize: 12,
                                                                              color: ThemeProvider.blackColor),
                                                                        )
                                                                      : const SizedBox(),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: List.generate(
                                                                        value.appointmentList[index].items!.services!.length,
                                                                        (serviceIndex) => Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  value.appointmentList[index].items!.services![serviceIndex].name.toString(),
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontFamily: 'regular', fontSize: 10, color: ThemeProvider.blackColor),
                                                                                ),
                                                                                RichText(
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentList[index].items!.services![serviceIndex].price.toString() : value.appointmentList[index].items!.services![serviceIndex].price.toString() + value.currencySymbol,
                                                                                        style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, decoration: TextDecoration.lineThrough),
                                                                                      ),
                                                                                      const TextSpan(text: ' '),
                                                                                      TextSpan(
                                                                                        text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentList[index].items!.services![serviceIndex].off.toString() : value.appointmentList[index].items!.services![serviceIndex].off.toString() + value.currencySymbol,
                                                                                        style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, fontFamily: 'bold'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  value
                                                                          .appointmentList[
                                                                              index]
                                                                          .items!
                                                                          .packages!
                                                                          .isNotEmpty
                                                                      ? Text(
                                                                          'Packages'
                                                                              .tr,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontFamily: 'bold',
                                                                              fontSize: 12,
                                                                              color: ThemeProvider.blackColor),
                                                                        )
                                                                      : const SizedBox(),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: List.generate(
                                                                        value.appointmentList[index].items!.packages!.length,
                                                                        (packageIndex) => Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      value.appointmentList[index].items!.packages![packageIndex].name.toString(),
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: const TextStyle(fontFamily: 'regular', fontSize: 10, color: ThemeProvider.blackColor),
                                                                                    ),
                                                                                    RichText(
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentList[index].items!.packages![packageIndex].price.toString() : value.appointmentList[index].items!.packages![packageIndex].price.toString() + value.currencySymbol,
                                                                                            style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, decoration: TextDecoration.lineThrough),
                                                                                          ),
                                                                                          const TextSpan(text: ' '),
                                                                                          TextSpan(
                                                                                            text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentList[index].items!.packages![packageIndex].off.toString() : value.appointmentList[index].items!.packages![packageIndex].off.toString() + value.currencySymbol,
                                                                                            style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, fontFamily: 'bold'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  children: List.generate(
                                                                                      value.appointmentList[index].items!.packages![packageIndex].services!.length,
                                                                                      (packageServiceIndex) => Row(
                                                                                            children: [
                                                                                              const SizedBox(
                                                                                                width: 10,
                                                                                              ),
                                                                                              const Text('-', style: TextStyle(fontSize: 8, fontFamily: 'regular', color: ThemeProvider.blackColor)),
                                                                                              Text(
                                                                                                value.appointmentList[index].items!.packages![packageIndex].services![packageServiceIndex].name.toString(),
                                                                                                style: const TextStyle(fontSize: 8, fontFamily: 'regular', color: ThemeProvider.blackColor),
                                                                                              )
                                                                                            ],
                                                                                          )),
                                                                                )
                                                                              ],
                                                                            )),
                                                                  )
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 1,
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  border:
                                                                      Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color: ThemeProvider
                                                                          .backgroundColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Grand Total :'
                                                                        .tr,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'bold',
                                                                        color: ThemeProvider
                                                                            .blackColor),
                                                                  ),
                                                                  Text(
                                                                    value.currencySide ==
                                                                            'left'
                                                                        ? value.currencySymbol +
                                                                            value.appointmentList[index].grandTotal
                                                                                .toString()
                                                                        : value.appointmentList[index].grandTotal.toString() +
                                                                            value.currencySymbol,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'bold',
                                                                        color: ThemeProvider
                                                                            .blackColor),
                                                                  )
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 1,
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  border:
                                                                      Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color: ThemeProvider
                                                                          .backgroundColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Appointment at :'
                                                                        .tr,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: ThemeProvider
                                                                            .appColor),
                                                                  ),
                                                                  Text(
                                                                    '${value.appointmentList[index].saveDate} ${value.appointmentList[index].slot}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/no-data.png',
                                                      width: 60,
                                                      height: 60),
                                                  const SizedBox(height: 30),
                                                  Text(
                                                    'No New Appointment Found!'
                                                        .tr,
                                                    style: const TextStyle(
                                                        fontFamily: 'bold',
                                                        color: ThemeProvider
                                                            .appColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child:
                                            value.appointmentListOld.isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: List.generate(
                                                      value.appointmentListOld
                                                          .length,
                                                      (index) => Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Banner(
                                                              message: value
                                                                  .statusName[value
                                                                          .appointmentListOld[
                                                                              index]
                                                                          .status
                                                                      as int]
                                                                  .tr,
                                                              color: value
                                                                          .statusName[
                                                                              value.appointmentListOld[index].status
                                                                                  as int]
                                                                          .tr ==
                                                                      "Accepted"
                                                                          .tr
                                                                  ? ThemeProvider
                                                                      .greenColor
                                                                  : value.statusName[value.appointmentListOld[index].status as int].tr ==
                                                                          "Ongoing"
                                                                              .tr
                                                                      ? ThemeProvider
                                                                          .orangeColor
                                                                      : value.statusName[value.appointmentListOld[index].status as int].tr ==
                                                                              "Completed".tr
                                                                          ? ThemeProvider.purpleColor
                                                                          : value.statusName[value.appointmentListOld[index].status as int].tr == "Delayed".tr
                                                                              ? ThemeProvider.yellowColor
                                                                              : value.statusName[value.appointmentListOld[index].status as int].tr == "Rejected".tr
                                                                                  ? ThemeProvider.redColor
                                                                                  : ThemeProvider.appColor,
                                                              location: BannerLocation.topStart,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: ThemeProvider
                                                                      .whiteColor,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: ThemeProvider
                                                                          .appColor
                                                                          .withOpacity(
                                                                              0.2),
                                                                      blurRadius:
                                                                          35.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    value.onAppointment(value
                                                                        .appointmentListOld[
                                                                            index]
                                                                        .id as int);
                                                                  },
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 10, left: 5),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              child: SizedBox.fromSize(
                                                                                size: const Size.fromRadius(25),
                                                                                child: FadeInImage(
                                                                                  image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.appointmentListOld[index].userInfo!.cover.toString()}'),
                                                                                  placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                                                                                  imageErrorBuilder: (context, error, stackTrace) {
                                                                                    return Image.asset(
                                                                                      'assets/images/notfound.png',
                                                                                      fit: BoxFit.cover,
                                                                                      height: 25,
                                                                                      width: 25,
                                                                                    );
                                                                                  },
                                                                                  fit: BoxFit.cover,
                                                                                  height: 25,
                                                                                  width: 25,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  '${value.appointmentListOld[index].userInfo!.firstName} ${value.appointmentListOld[index].userInfo!.lastName}',
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontFamily: 'bold', fontSize: 12, color: ThemeProvider.blackColor),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        value.appointmentListOld[index].appointmentsTo == 1 ? '${value.appointmentListOld[index].address!.house} ${value.appointmentListOld[index].address!.address} ${value.appointmentListOld[index].address!.landmark} ${value.appointmentListOld[index].address!.pincode}' : 'At Salon'.tr,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        maxLines: 2,
                                                                                        style: const TextStyle(fontSize: 11, color: ThemeProvider.blackColor),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  "Appointments ID #".tr + value.appointmentListOld[index].id.toString(),
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontSize: 12, color: ThemeProvider.blackColor),
                                                                                ),
                                                                                Text(
                                                                                  "Date & Time: ".tr + "${value.appointmentListOld[index].saveDate} ${value.appointmentListOld[index].slot}",
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontSize: 12, color: ThemeProvider.blackColor),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            1,
                                                                        margin: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                10),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                            bottom:
                                                                                BorderSide(
                                                                              color: ThemeProvider.backgroundColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          value.appointmentListOld[index].items!.services!.isNotEmpty
                                                                              ? Text(
                                                                                  'Treatment(s)'.tr,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontFamily: 'bold', fontSize: 12, color: ThemeProvider.blackColor),
                                                                                )
                                                                              : const SizedBox(),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: List.generate(
                                                                                value.appointmentListOld[index].items!.services!.length,
                                                                                (serviceIndex) => Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          value.appointmentListOld[index].items!.services![serviceIndex].name.toString(),
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          style: const TextStyle(fontFamily: 'regular', fontSize: 10, color: ThemeProvider.blackColor),
                                                                                        ),
                                                                                        RichText(
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentListOld[index].items!.services![serviceIndex].price.toString() : value.appointmentListOld[index].items!.services![serviceIndex].price.toString() + value.currencySymbol,
                                                                                                style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, decoration: TextDecoration.lineThrough),
                                                                                              ),
                                                                                              const TextSpan(text: ' '),
                                                                                              TextSpan(
                                                                                                text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentListOld[index].items!.services![serviceIndex].off.toString() : value.appointmentListOld[index].items!.services![serviceIndex].off.toString() + value.currencySymbol,
                                                                                                style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, fontFamily: 'bold'),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          value.appointmentListOld[index].items!.packages!.isNotEmpty
                                                                              ? Text(
                                                                                  'Packages'.tr,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: const TextStyle(fontFamily: 'bold', fontSize: 12, color: ThemeProvider.blackColor),
                                                                                )
                                                                              : const SizedBox(),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: List.generate(
                                                                                value.appointmentListOld[index].items!.packages!.length,
                                                                                (packageIndex) => Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              value.appointmentListOld[index].items!.packages![packageIndex].name.toString(),
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              style: const TextStyle(fontFamily: 'regular', fontSize: 10, color: ThemeProvider.blackColor),
                                                                                            ),
                                                                                            RichText(
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentListOld[index].items!.packages![packageIndex].price.toString() : value.appointmentListOld[index].items!.packages![packageIndex].price.toString() + value.currencySymbol,
                                                                                                    style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, decoration: TextDecoration.lineThrough),
                                                                                                  ),
                                                                                                  const TextSpan(text: ' '),
                                                                                                  TextSpan(
                                                                                                    text: value.currencySide == 'left' ? value.currencySymbol + value.appointmentListOld[index].items!.packages![packageIndex].off.toString() : value.appointmentListOld[index].items!.packages![packageIndex].off.toString() + value.currencySymbol,
                                                                                                    style: const TextStyle(fontSize: 10, color: ThemeProvider.blackColor, fontFamily: 'bold'),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Column(
                                                                                          children: List.generate(
                                                                                              value.appointmentListOld[index].items!.packages![packageIndex].services!.length,
                                                                                              (packageServiceIndex) => Row(
                                                                                                    children: [
                                                                                                      const SizedBox(
                                                                                                        width: 10,
                                                                                                      ),
                                                                                                      const Text('-', style: TextStyle(fontSize: 8, fontFamily: 'regular', color: ThemeProvider.blackColor)),
                                                                                                      Text(
                                                                                                        value.appointmentListOld[index].items!.packages![packageIndex].services![packageServiceIndex].name.toString(),
                                                                                                        style: const TextStyle(fontSize: 8, fontFamily: 'regular', color: ThemeProvider.blackColor),
                                                                                                      )
                                                                                                    ],
                                                                                                  )),
                                                                                        )
                                                                                      ],
                                                                                    )),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            1,
                                                                        margin: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                10),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                            bottom:
                                                                                BorderSide(
                                                                              color: ThemeProvider.backgroundColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Grand Total :'.tr,
                                                                            style: const TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: 'bold',
                                                                                color: ThemeProvider.blackColor),
                                                                          ),
                                                                          Text(
                                                                            value.currencySide == 'left'
                                                                                ? value.currencySymbol +
                                                                                    (((2.99 + ((value.appointmentListOld[index].grandTotal! - value.appointmentListOld[index].serviceTax!.toDouble() - value.appointmentListOld[index].distanceCost!.toDouble()) * 0.2) + ((value.appointmentListOld[index].grandTotal! - value.appointmentListOld[index].serviceTax!.toDouble() - value.appointmentListOld[index].distanceCost!.toDouble()) * 0.2 * 0.035))) + ((value.appointmentListOld[index].grandTotal! - value.appointmentListOld[index].serviceTax!.toDouble() - value.appointmentListOld[index].distanceCost!.toDouble()) - ((value.appointmentListOld[index].grandTotal! - value.appointmentListOld[index].serviceTax!.toDouble() - value.appointmentListOld[index].distanceCost!.toDouble()) * 0.2))
                                                                                        // value.appointmentListOld[index].grandTotal!.toDouble()
                                                                                        )
                                                                                        .toStringAsFixed(3)
                                                                                : value.appointmentListOld[index].grandTotal.toString() + value.currencySymbol,
                                                                            style: const TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: 'bold',
                                                                                color: ThemeProvider.blackColor),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            1,
                                                                        margin: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                10),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                            bottom:
                                                                                BorderSide(
                                                                              color: ThemeProvider.backgroundColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // Row(
                                                                      //   mainAxisAlignment:
                                                                      //       MainAxisAlignment.spaceBetween,
                                                                      //   crossAxisAlignment:
                                                                      //       CrossAxisAlignment.center,
                                                                      //   children: [
                                                                      //     Text(
                                                                      //       'Appointment at :'.tr,
                                                                      //       style:
                                                                      //           const TextStyle(fontSize: 12, color: ThemeProvider.appColor),
                                                                      //     ),
                                                                      //     Text(
                                                                      //       '${value.appointmentListOld[index].saveDate} ${value.appointmentListOld[index].slot}',
                                                                      //       style:
                                                                      //           const TextStyle(
                                                                      //         fontSize: 12,
                                                                      //       ),
                                                                      //     )
                                                                      //   ],
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/no-data.png',
                                                            width: 60,
                                                            height: 60),
                                                        const SizedBox(
                                                            height: 30),
                                                        Text(
                                                          'No Past Appointment Found!'
                                                              .tr,
                                                          style: const TextStyle(
                                                              fontFamily:
                                                                  'bold',
                                                              color:
                                                                  ThemeProvider
                                                                      .appColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 100, left: 25, right: 25),
                          child: Container(
                            height:
                                50.0, // Adjust the height of the tab bar as needed
                            decoration: BoxDecoration(
                                color: ThemeProvider
                                    .whiteColor, // Color of the tab bar
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: ThemeProvider.appColor)),
                            child: TabBar(
                              unselectedLabelColor: Colors.grey.shade600,
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'bold',
                                  color: Colors.white),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.all(4),
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Creates border
                                  color: ThemeProvider.appColor),
                              controller: value.tabController,
                              tabs: [
                                Tab(
                                  text: 'New',
                                ),
                                Tab(text: 'Old'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
        );
      },
    );
  }
}
