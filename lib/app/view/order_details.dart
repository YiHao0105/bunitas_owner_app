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
import 'package:ultimate_salon_owner_flutter/app/controller/order_details_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          // appBar: AppBar(
          //   backgroundColor: ThemeProvider.appColor,
          //   elevation: 0,
          //   iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
          //   titleSpacing: 0,
          //   title: Text(
          //     "Appointments No #".tr + value.id.toString(),
          //     style: ThemeProvider.titleStyle,
          //   ),
          //   actions: <Widget>[
          //     IconButton(
          //         onPressed: () {
          //           value.launchInBrowser();
          //         },
          //         icon: const Icon(Icons.print_outlined)),
          //     IconButton(
          //         onPressed: () {
          //           value.openHelpModal();
          //         },
          //         icon: const Icon(Icons.question_mark_outlined))
          //   ],
          // ),
          body: value.apiCalled == false
              ? const Center(
                  child:
                      CircularProgressIndicator(color: ThemeProvider.appColor),
                )
              : Column(
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
                                    "Appointments No #".tr +
                                        value.id.toString(),
                                    style: const TextStyle(
                                        color: ThemeProvider.blackColor,
                                        fontSize: 14,
                                        fontFamily: 'bold'),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: ThemeProvider.whiteColor),
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      )),
                                  Wrap(
                                    spacing: 3,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: ThemeProvider.whiteColor),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.print_outlined,
                                            ),
                                            onPressed: () {
                                              value.launchInBrowser();
                                            },
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: ThemeProvider.whiteColor),
                                          child: IconButton(
                                            icon: Icon(
                                                Icons.question_mark_outlined),
                                            onPressed: () {
                                              value.openHelpModal();
                                            },
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(30),
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          '${Environments.apiBaseURL}storage/images/${value.appointmentInfo.userInfo!.cover.toString()}'),
                                      placeholder: const AssetImage(
                                          "assets/images/placeholder.jpeg"),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/notfound.png',
                                          fit: BoxFit.cover,
                                          height: 30,
                                          width: 30,
                                        );
                                      },
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${value.appointmentInfo.userInfo!.firstName} ${value.appointmentInfo.userInfo!.lastName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontFamily: 'bold', fontSize: 14),
                                      ),
                                      Text(
                                        value.appointmentInfo.userInfo!.email
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        value.appointmentInfo.userInfo!.mobile
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.onContactInfo(
                                        '${value.appointmentInfo.userInfo!.firstName!} ${value.appointmentInfo.userInfo!.lastName!}',
                                        value.appointmentInfo.userInfo!.mobile!,
                                        value.appointmentInfo.userInfo!.email!,
                                        value.appointmentInfo.userInfo!.id
                                            .toString());
                                  },
                                  icon: const Icon(Icons.info),
                                  color: ThemeProvider.appColor,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Treatment at'.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: ThemeProvider.appColor,
                                          fontFamily: 'bold',
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      value.appointmentInfo.appointmentsTo == 0
                                          ? 'At Salon'.tr
                                          : '${value.appointmentInfo.address!.house} ${value.appointmentInfo.address!.address} ${value.appointmentInfo.address!.landmark} ${value.appointmentInfo.address!.pincode}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: ThemeProvider.greyColor,
                                          fontFamily: 'bold',
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Booking Date & Time'.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: ThemeProvider.appColor,
                                          fontFamily: 'bold',
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Booking Date'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.appointmentInfo.saveDate
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.appColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Booking Time'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.appointmentInfo.slot.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.appColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  value.appointmentInfo.items!.services!
                                          .isNotEmpty
                                      ? Text(
                                          'Treatment(s)'.tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: ThemeProvider.appColor,
                                              fontFamily: 'bold',
                                              fontSize: 15),
                                        )
                                      : const SizedBox(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                        value.appointmentInfo.items!.services!
                                            .length,
                                        (serviceIndex) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  value
                                                      .appointmentInfo
                                                      .items!
                                                      .services![serviceIndex]
                                                      .name
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontFamily: 'regular',
                                                      fontSize: 10,
                                                      color: ThemeProvider
                                                          .blackColor),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: value.currencySide ==
                                                                'left'
                                                            ? value.currencySymbol +
                                                                value
                                                                    .appointmentInfo
                                                                    .items!
                                                                    .services![
                                                                        serviceIndex]
                                                                    .price
                                                                    .toString()
                                                            : value
                                                                    .appointmentInfo
                                                                    .items!
                                                                    .services![
                                                                        serviceIndex]
                                                                    .price
                                                                    .toString() +
                                                                value
                                                                    .currencySymbol,
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            color: ThemeProvider
                                                                .blackColor,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                      const TextSpan(text: ' '),
                                                      TextSpan(
                                                        text: value.currencySide ==
                                                                'left'
                                                            ? value.currencySymbol +
                                                                value
                                                                    .appointmentInfo
                                                                    .items!
                                                                    .services![
                                                                        serviceIndex]
                                                                    .off
                                                                    .toString()
                                                            : value
                                                                    .appointmentInfo
                                                                    .items!
                                                                    .services![
                                                                        serviceIndex]
                                                                    .off
                                                                    .toString() +
                                                                value
                                                                    .currencySymbol,
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            color: ThemeProvider
                                                                .blackColor,
                                                            fontFamily: 'bold'),
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
                                  value.appointmentInfo.items!.packages!
                                          .isNotEmpty
                                      ? Text(
                                          'Packages'.tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: ThemeProvider.appColor,
                                              fontFamily: 'bold',
                                              fontSize: 15),
                                        )
                                      : const SizedBox(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                        value.appointmentInfo.items!.packages!
                                            .length,
                                        (packageIndex) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      value
                                                          .appointmentInfo
                                                          .items!
                                                          .packages![
                                                              packageIndex]
                                                          .name
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontFamily: 'regular',
                                                          fontSize: 10,
                                                          color: ThemeProvider
                                                              .blackColor),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: value.currencySide ==
                                                                    'left'
                                                                ? value.currencySymbol +
                                                                    value
                                                                        .appointmentInfo
                                                                        .items!
                                                                        .packages![
                                                                            packageIndex]
                                                                        .price
                                                                        .toString()
                                                                : value
                                                                        .appointmentInfo
                                                                        .items!
                                                                        .packages![
                                                                            packageIndex]
                                                                        .price
                                                                        .toString() +
                                                                    value
                                                                        .currencySymbol,
                                                            style: const TextStyle(
                                                                fontSize: 10,
                                                                color: ThemeProvider
                                                                    .blackColor,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          ),
                                                          const TextSpan(
                                                              text: ' '),
                                                          TextSpan(
                                                            text: value.currencySide ==
                                                                    'left'
                                                                ? value.currencySymbol +
                                                                    value
                                                                        .appointmentInfo
                                                                        .items!
                                                                        .packages![
                                                                            packageIndex]
                                                                        .off
                                                                        .toString()
                                                                : value
                                                                        .appointmentInfo
                                                                        .items!
                                                                        .packages![
                                                                            packageIndex]
                                                                        .off
                                                                        .toString() +
                                                                    value
                                                                        .currencySymbol,
                                                            style: const TextStyle(
                                                                fontSize: 10,
                                                                color: ThemeProvider
                                                                    .blackColor,
                                                                fontFamily:
                                                                    'bold'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: List.generate(
                                                      value
                                                          .appointmentInfo
                                                          .items!
                                                          .packages![
                                                              packageIndex]
                                                          .services!
                                                          .length,
                                                      (packageServiceIndex) =>
                                                          Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              const Text('-',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          8,
                                                                      fontFamily:
                                                                          'regular',
                                                                      color: ThemeProvider
                                                                          .blackColor)),
                                                              Text(
                                                                value
                                                                    .appointmentInfo
                                                                    .items!
                                                                    .packages![
                                                                        packageIndex]
                                                                    .services![
                                                                        packageServiceIndex]
                                                                    .name
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 8,
                                                                    fontFamily:
                                                                        'regular',
                                                                    color: ThemeProvider
                                                                        .blackColor),
                                                              )
                                                            ],
                                                          )),
                                                )
                                              ],
                                            )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pricing'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: ThemeProvider.appColor,
                                        fontFamily: 'bold',
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Expanded(
                                //       child: Text(
                                //         'Wallet Discount'.tr,
                                //         overflow: TextOverflow.ellipsis,
                                //         style: const TextStyle(
                                //             color: ThemeProvider.greyColor,
                                //             fontSize: 15),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Text(
                                //         value.currencySide == 'left'
                                //             ? value.currencySymbol +
                                //                 value
                                //                     .appointmentInfo.walletPrice
                                //                     .toString()
                                //             : value.appointmentInfo.walletPrice
                                //                     .toString() +
                                //                 value.currencySymbol,
                                //         overflow: TextOverflow.ellipsis,
                                //         textAlign: TextAlign.end,
                                //         style: const TextStyle(
                                //             color: ThemeProvider.greyColor,
                                //             fontSize: 15),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Treatment Cost'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? value.currencySymbol +
                                                value.appointmentInfo.total
                                                    .toString()
                                            : value.appointmentInfo.total
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Distance Cost'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? value.currencySymbol + "0"
                                            // value.appointmentInfo
                                            //     .distanceCost
                                            //     .toString()
                                            : value.appointmentInfo.distanceCost
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Total Discount'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? "-" +
                                                value.currencySymbol +
                                                value.appointmentInfo.discount
                                                    .toString()
                                            : value.appointmentInfo.discount
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.redColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Subtotal'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 15,
                                            fontFamily: "bold"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? (value.currencySymbol +
                                                (value.appointmentInfo
                                                            .grandTotal! -
                                                        value.appointmentInfo
                                                            .serviceTax!
                                                            .toDouble() -
                                                        value.appointmentInfo
                                                            .distanceCost!
                                                            .toDouble())
                                                    .toStringAsFixed(2))
                                            : (value.appointmentInfo
                                                            .grandTotal! -
                                                        value.appointmentInfo
                                                            .serviceTax!
                                                            .toDouble())
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 15,
                                            fontFamily: "bold"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Deposit (20%)'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? (value.currencySymbol +
                                                (((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble() -
                                                            value
                                                                .appointmentInfo
                                                                .distanceCost!
                                                                .toDouble()) *
                                                        0.2))
                                                    .toStringAsFixed(3))
                                            : ((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble()) *
                                                        0.2)
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Booking Fees'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? value.currencySymbol + "2.99"
                                            //  ((value.appointmentInfo
                                            //                 .grandTotal! -
                                            //             value.appointmentInfo
                                            //                 .serviceTax!
                                            //                 .toDouble()) *
                                            //         0.2)
                                            //     .toStringAsFixed(2)
                                            : ((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble()) *
                                                        0.2)
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Processing Fees (3.5%)'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? (value.currencySymbol +
                                                (((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble() -
                                                            value
                                                                .appointmentInfo
                                                                .distanceCost!
                                                                .toDouble()) *
                                                        0.2 *
                                                        0.035))
                                                    .toStringAsFixed(2))
                                            : ((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble()) *
                                                        0.2 *
                                                        0.035)
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Expanded(
                                //       child: Text(
                                //         'Service Tax'.tr,
                                //         overflow: TextOverflow.ellipsis,
                                //         style: const TextStyle(
                                //             color: ThemeProvider.greyColor,
                                //             fontSize: 15),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Text(
                                //         value.currencySide == 'left'
                                //             ? value.currencySymbol +
                                //                 value.appointmentInfo.serviceTax
                                //                     .toString()
                                //             : value.appointmentInfo.serviceTax
                                //                     .toString() +
                                //                 value.currencySymbol,
                                //         overflow: TextOverflow.ellipsis,
                                //         textAlign: TextAlign.end,
                                //         style: const TextStyle(
                                //             color: ThemeProvider.greyColor,
                                //             fontSize: 15),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Total To Pay Now'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 15,
                                            fontFamily: "bold"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.currencySide == 'left'
                                            ? (value.currencySymbol +
                                                ((2.99 +
                                                        ((value.appointmentInfo
                                                                    .grandTotal! -
                                                                value.appointmentInfo
                                                                    .serviceTax!
                                                                    .toDouble() -
                                                                value.appointmentInfo
                                                                    .distanceCost!
                                                                    .toDouble()) *
                                                            0.2) +
                                                        ((value.appointmentInfo
                                                                    .grandTotal! -
                                                                value
                                                                    .appointmentInfo
                                                                    .serviceTax!
                                                                    .toDouble() -
                                                                value
                                                                    .appointmentInfo
                                                                    .distanceCost!
                                                                    .toDouble()) *
                                                            0.2 *
                                                            0.035)))
                                                    .toStringAsFixed(2))
                                            : ((value.appointmentInfo
                                                                .grandTotal! -
                                                            value
                                                                .appointmentInfo
                                                                .serviceTax!
                                                                .toDouble()) *
                                                        0.2)
                                                    .toString() +
                                                value.currencySymbol,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.appColor,
                                            fontSize: 15,
                                            fontFamily: "bold"),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Payment Type'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        value.paymentName[value
                                            .appointmentInfo.payMethod as int],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Pay At Salon/Beautician'.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: ThemeProvider.blackColor,
                                          fontSize: 15,
                                          fontFamily: "bold"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      value.currencySide == 'left'
                                          ? value.currencySymbol +
                                              // value.appointmentInfo.grandTotal
                                              //     .toString()
                                              ((value.appointmentInfo.grandTotal! -
                                                          value.appointmentInfo
                                                              .serviceTax!
                                                              .toDouble() -
                                                          value.appointmentInfo
                                                              .distanceCost!
                                                              .toDouble()) -
                                                      ((value.appointmentInfo
                                                                  .grandTotal! -
                                                              value
                                                                  .appointmentInfo
                                                                  .serviceTax!
                                                                  .toDouble() -
                                                              value
                                                                  .appointmentInfo
                                                                  .distanceCost!
                                                                  .toDouble()) *
                                                          0.2))
                                                  .toStringAsFixed(3)
                                          : value.appointmentInfo.grandTotal
                                                  .toString() +
                                              value.currencySymbol,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          color: ThemeProvider.blackColor,
                                          fontFamily: 'bold',
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: value.apiCalled == false
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: value.appointmentInfo.status == 2 ||
                          value.appointmentInfo.status == 4 ||
                          value.appointmentInfo.status == 5 ||
                          value.appointmentInfo.status == 6
                      ? Text(
                          '${'Your Appoinments Status'.tr} : ${value.orderStatus}',
                          textAlign: TextAlign.center,
                        )
                      : value.appointmentInfo.status == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        value.onUpdateAppointmentStatus(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeProvider.whiteColor,
                                          backgroundColor:
                                              ThemeProvider.appColor,
                                          shadowColor: ThemeProvider.blackColor,
                                          elevation: 3,
                                          shape: (RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                          padding: const EdgeInsets.all(0)),
                                      child: Text(
                                        'Accept'.tr,
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: ThemeProvider.whiteColor,
                                            fontFamily: 'bold'),
                                      )),
                                )),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        value.onUpdateAppointmentStatus(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeProvider.whiteColor,
                                          backgroundColor:
                                              ThemeProvider.greyColor,
                                          shadowColor: ThemeProvider.blackColor,
                                          elevation: 3,
                                          shape: (RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                          padding: const EdgeInsets.all(0)),
                                      child: Text(
                                        'Decline'.tr,
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: ThemeProvider.whiteColor,
                                            fontFamily: 'bold'),
                                      )),
                                )),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: ThemeProvider.whiteColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ThemeProvider.blackColor
                                                  .withOpacity(0.2),
                                              offset: const Offset(0, 1),
                                              blurRadius: 3),
                                        ],
                                      ),
                                      child: DropdownButton<String>(
                                        value: value.savedStatus,
                                        underline: const SizedBox(),
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                        ),
                                        iconEnabledColor:
                                            ThemeProvider.blackColor,
                                        onChanged: (String? newValue) {
                                          value.onSelectStatus(
                                              newValue.toString());
                                        },
                                        items: value.selectStatus
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        value.updateStatus();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeProvider.whiteColor,
                                          backgroundColor:
                                              ThemeProvider.appColor,
                                          shadowColor: ThemeProvider.blackColor,
                                          elevation: 3,
                                          shape: (RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                          padding: const EdgeInsets.all(0)),
                                      child: Text(
                                        'Update Status'.tr,
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: ThemeProvider.whiteColor,
                                            fontFamily: 'bold'),
                                      )),
                                )),
                              ],
                            ),
                ),
        );
      },
    );
  }
}
