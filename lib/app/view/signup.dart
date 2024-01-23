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
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ultimate_salon_owner_flutter/app/backend/models/city_model.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/signup_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:country_picker/country_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime date = DateTime(2022, 12, 24);
  String genderValue = 'Male';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
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
          //     'Partner Registration'.tr,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.start,
          //     style: ThemeProvider.titleStyle,
          //   ),
          // ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: value.currentView == 1
                ? InkWell(
                    onTap: () {
                      value.onNext();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: contentButtonStyle(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next'.tr,
                            style: const TextStyle(
                                color: ThemeProvider.whiteColor, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  )
                : value.currentView == 2
                    ? SizedBox()
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Expanded(
                    //           child: SizedBox(
                    //         width: double.infinity,
                    //         height: 40,
                    //         child: ElevatedButton(
                    //             onPressed: () {
                    //               value.onBack();
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //                 foregroundColor: ThemeProvider.whiteColor,
                    //                 backgroundColor: ThemeProvider.greyColor,
                    //                 shadowColor: ThemeProvider.blackColor,
                    //                 elevation: 3,
                    //                 shape: (RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(50),
                    //                 )),
                    //                 padding: const EdgeInsets.all(0)),
                    //             child: Text(
                    //               'Previews'.tr,
                    //               style: const TextStyle(
                    //                   letterSpacing: 1,
                    //                   fontSize: 16,
                    //                   color: ThemeProvider.whiteColor,
                    //                   fontFamily: 'bold'),
                    //             )),
                    //       )),
                    //       const SizedBox(width: 10),
                    //       Expanded(
                    //           child: SizedBox(
                    //         width: double.infinity,
                    //         height: 40,
                    //         child: ElevatedButton(
                    //             onPressed: () {
                    //               value.onRegister();
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //                 foregroundColor: ThemeProvider.whiteColor,
                    //                 backgroundColor: ThemeProvider.appColor,
                    //                 shadowColor: ThemeProvider.blackColor,
                    //                 elevation: 3,
                    //                 shape: (RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(50),
                    //                 )),
                    //                 padding: const EdgeInsets.all(0)),
                    //             child: Text(
                    //               'Submit'.tr,
                    //               style: const TextStyle(
                    //                   letterSpacing: 1,
                    //                   fontSize: 16,
                    //                   color: ThemeProvider.whiteColor,
                    //                   fontFamily: 'bold'),
                    //             )),
                    //       )),
                    //     ],
                    //   )
                    : const SizedBox(),
          ),
          body: SingleChildScrollView(
              child: value.currentView == 1
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Select your type'.tr,
                            style: const TextStyle(
                                fontFamily: 'bold', fontSize: 14),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(1);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 1
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 1
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Hair & Nails Salon'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/salon.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(0);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 0
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 0
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Mobile Beautician'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/freelancer.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(2);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 2
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 2
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Barber Shop'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/freelancer.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(3);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 3
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 3
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Wellness & Spa'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/freelancer.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(4);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 4
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 4
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Beauty Clinics'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/freelancer.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.updateType(5);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: ThemeProvider.greyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              value.type == 5
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: value.type == 5
                                                  ? ThemeProvider.appColor
                                                  : ThemeProvider.greyColor),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Products Only'.tr,
                                            style: const TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/freelancer.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 25),
                                    height: 150.0,
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Partner Registration'.tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.blackColor,
                                                fontSize: 25,
                                                fontFamily: 'bold'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 120,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white),
                                        padding: EdgeInsets.all(8.0),
                                        child: ClipOval(
                                          child: GestureDetector(
                                            onTap: () {
                                              chooseFile(
                                                  context, value, "profile");
                                            },
                                            child: Image.network(
                                              "${Environments.apiBaseURL}storage/images/${value.cover}",
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.fitWidth,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    'assets/images/placeholder.jpeg',
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller: value.emailTextEditor,
                                          readOnly: value.emailVerified,
                                          onChanged: (String txt) {},
                                          cursorColor: ThemeProvider.appColor,
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ThemeProvider.greyColor),
                                              border: InputBorder.none,
                                              labelText: "Enter your email".tr,
                                              // suffix: GestureDetector(
                                              //     onTap: () {
                                              //       value.verifyEmail();
                                              //     },
                                              //     child: Text(
                                              //       value.emailVerified == false
                                              //           ? 'Verify'.tr
                                              //           : 'Verified'.tr,
                                              //       style: TextStyle(
                                              //           color:
                                              //               value.emailVerified ==
                                              //                       true
                                              //                   ? ThemeProvider
                                              //                       .appColor
                                              //                   : ThemeProvider
                                              //                       .redColor,
                                              //           fontSize: 12),
                                              //     )),
                                              suffixIcon: Icon(
                                                CupertinoIcons.mail,
                                                color: ThemeProvider.appColor,
                                              )),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                          decoration: textFieldDecoration(),
                                          width: 60,
                                          child: GestureDetector(
                                            onTap: () {
                                              showCountryPicker(
                                                context: context,
                                                favorite: <String>['GB'],
                                                showPhoneCode: true,
                                                onSelect: (Country country) {
                                                  if (value.phoneVerified ==
                                                      false) {
                                                    value.saveCountryCode(
                                                        country.phoneCode
                                                            .toString());
                                                    debugPrint(
                                                        country.phoneCode);
                                                  }
                                                },
                                                countryListTheme:
                                                    CountryListThemeData(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40.0),
                                                    topRight:
                                                        Radius.circular(40.0),
                                                  ),
                                                  inputDecoration:
                                                      InputDecoration(
                                                    labelText: 'Search'.tr,
                                                    hintText:
                                                        'Start typing to search'
                                                            .tr,
                                                    prefixIcon: const Icon(
                                                        Icons.search),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: const Color(
                                                                0xFF8C98A8)
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                smallText('Code'.tr),
                                                const SizedBox(height: 4),
                                                bodyText1(value
                                                    .countryCodeMobile
                                                    .toString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              decoration: textFieldDecoration(),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    value.mobileTextEditor,
                                                onChanged: (String txt) {},
                                                readOnly: value.phoneVerified,
                                                cursorColor:
                                                    ThemeProvider.appColor,
                                                decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        fontSize: 14,
                                                        color: ThemeProvider
                                                            .greyColor),
                                                    border: InputBorder.none,
                                                    labelText:
                                                        "Enter your phone".tr,
                                                    // suffix: GestureDetector(
                                                    //     onTap: () {
                                                    //       value.verifyPhone();
                                                    //     },
                                                    //     child: Text(
                                                    //       value.phoneVerified ==
                                                    //               false
                                                    //           ? 'Verify'.tr
                                                    //           : 'Verified'.tr,
                                                    //       style: TextStyle(
                                                    //           color: value.phoneVerified ==
                                                    //                   true
                                                    //               ? ThemeProvider
                                                    //                   .appColor
                                                    //               : ThemeProvider
                                                    //                   .redColor,
                                                    //           fontSize: 12),
                                                    //     )),
                                                    suffixIcon: Icon(
                                                      CupertinoIcons.phone,
                                                      color: ThemeProvider
                                                          .appColor,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          controller: value.passwordTextEditor,
                                          onChanged: (String txt) {},
                                          cursorColor: ThemeProvider.appColor,
                                          obscureText: value.passwordVisible,
                                          decoration: InputDecoration(
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: ThemeProvider.greyColor),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                value.togglePasswordBtn();
                                              },
                                              icon: Icon(
                                                value.passwordVisible
                                                    ? CupertinoIcons.eye
                                                    : CupertinoIcons.eye_slash,
                                                color: ThemeProvider.appColor,
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            labelText: "Password".tr,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          controller:
                                              value.confirmPasswordTextEditor,
                                          onChanged: (String txt) {},
                                          cursorColor: ThemeProvider.appColor,
                                          obscureText:
                                              value.confirmPasswordVisible,
                                          decoration: InputDecoration(
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: ThemeProvider.greyColor),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                value
                                                    .toggleConfirmPasswordBtn();
                                              },
                                              icon: Icon(
                                                value.passwordVisible
                                                    ? CupertinoIcons.eye
                                                    : CupertinoIcons.eye_slash,
                                                color: ThemeProvider.appColor,
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            labelText: "Confirm Password".tr,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "PERSONAL DETAILS",
                                          style: TextStyle(
                                              fontSize: 20, fontFamily: 'bold'),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              decoration: textFieldDecoration(),
                                              child: TextFormField(
                                                controller:
                                                    value.firstNameTextEditor,
                                                onChanged: (String txt) {},
                                                cursorColor:
                                                    ThemeProvider.appColor,
                                                decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        fontSize: 14,
                                                        color: ThemeProvider
                                                            .greyColor),
                                                    border: InputBorder.none,
                                                    labelText: "First Name".tr),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              decoration: textFieldDecoration(),
                                              child: TextFormField(
                                                controller:
                                                    value.lastNameTextEditor,
                                                onChanged: (String txt) {},
                                                cursorColor:
                                                    ThemeProvider.appColor,
                                                decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        fontSize: 14,
                                                        color: ThemeProvider
                                                            .greyColor),
                                                    border: InputBorder.none,
                                                    labelText: "Last Name".tr),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: DropdownButton<String>(
                                            iconDisabledColor:
                                                ThemeProvider.appColor,
                                            iconEnabledColor:
                                                ThemeProvider.appColor,
                                            value: value.selectedGender,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            onChanged: (String? newValue) {
                                              value.saveGender(
                                                  newValue.toString());
                                            },
                                            items: value.genderList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: value.dateInput,
                                          cursorColor: ThemeProvider.appColor,
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ThemeProvider.greyColor),
                                              border: InputBorder.none,
                                              labelText:
                                                  "Select your date of birth",
                                              suffixIcon: Icon(
                                                Icons.cake,
                                                color: ThemeProvider.appColor,
                                              )),
                                          onTap: () async {
                                            value.selectDate(context);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "BUSINESS DETAILS",
                                          style: TextStyle(
                                              fontSize: 20, fontFamily: 'bold'),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    value.type != 0
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              decoration: textFieldDecoration(),
                                              child: TextFormField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: value.name,
                                                onChanged: (String txt) {},
                                                cursorColor:
                                                    ThemeProvider.appColor,
                                                decoration: InputDecoration(
                                                  labelStyle: const TextStyle(
                                                      fontSize: 14,
                                                      color: ThemeProvider
                                                          .greyColor),
                                                  border: InputBorder.none,
                                                  labelText: "Business Name".tr,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8),
                                    //   child: Container(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 16),
                                    //     decoration: textFieldDecoration(),
                                    //     child: TextFormField(
                                    //       controller: value.feeStart,
                                    //       cursorColor: ThemeProvider.appColor,
                                    //       keyboardType: TextInputType.number,
                                    //       decoration: InputDecoration(
                                    //         labelStyle: const TextStyle(
                                    //             fontSize: 14,
                                    //             color: ThemeProvider.greyColor),
                                    //         border: InputBorder.none,
                                    //         labelText: "Fee Started Price".tr,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller:
                                              value.descriptionsTextEditor,
                                          onChanged: (String txt) {},
                                          cursorColor: ThemeProvider.appColor,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: ThemeProvider.greyColor),
                                            border: InputBorder.none,
                                            hintText: "About Your Business".tr,
                                            hintStyle: const TextStyle(
                                                fontSize: 14,
                                                color: ThemeProvider.greyColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.onCategoriesList();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            bodyText1('Select Treatment'.tr),
                                            const SizedBox(height: 4),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  value.servedCategoriesList
                                                      .length,
                                                  (index) => Text(value
                                                      .servedCategoriesList[
                                                          index]
                                                      .name
                                                      .toString())),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: DropdownButton<CityModal>(
                                            iconDisabledColor:
                                                ThemeProvider.appColor,
                                            iconEnabledColor:
                                                ThemeProvider.appColor,
                                            underline: const SizedBox(),
                                            isExpanded: true,
                                            value: value.selectedCity,
                                            items: value.cityList
                                                .map((CityModal value) {
                                              return DropdownMenuItem<
                                                  CityModal>(
                                                value: value,
                                                child:
                                                    Text(value.name.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              value.onCityChanged(
                                                  newValue as CityModal);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller: value.addressTextEditor,
                                          onChanged: (String txt) {},
                                          cursorColor: ThemeProvider.appColor,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ThemeProvider.greyColor),
                                              border: InputBorder.none,
                                              labelText: "Address".tr),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          controller: value.zipcode,
                                          cursorColor: ThemeProvider.appColor,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: ThemeProvider.greyColor),
                                            border: InputBorder.none,
                                            labelText: "Postcode".tr,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Column(
                                    //   children: [
                                    //     Text(
                                    //       'Select Latitude & Longitude from here :'
                                    //           .tr,
                                    //       style: const TextStyle(
                                    //           fontSize: 12,
                                    //           fontFamily: 'regular'),
                                    //     ),
                                    //     const SizedBox(
                                    //       height: 5,
                                    //     ),
                                    //     InkWell(
                                    //       onTap: () {
                                    //         value.openLink();
                                    //       },
                                    //       child: const Text(
                                    //           'https://www.mapcoordinates.net/en',
                                    //           style: TextStyle(
                                    //               fontSize: 12,
                                    //               fontFamily: 'regular',
                                    //               color: Colors.blue)),
                                    //     ),
                                    //     const SizedBox(
                                    //       height: 10,
                                    //     ),
                                    //     Text(
                                    //       'Please enter valid Latitude & Longitude otherwise app may not work properly.'
                                    //           .tr,
                                    //       style: const TextStyle(
                                    //           fontSize: 12,
                                    //           fontFamily: 'regular'),
                                    //       textAlign: TextAlign.center,
                                    //     ),
                                    //   ],
                                    // ),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8),
                                    //   child: Container(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 16),
                                    //     decoration: textFieldDecoration(),
                                    //     child: TextFormField(
                                    //       controller: value.lat,
                                    //       cursorColor: ThemeProvider.appColor,
                                    //       keyboardType: TextInputType.number,
                                    //       decoration: InputDecoration(
                                    //         labelStyle: const TextStyle(
                                    //             fontSize: 14,
                                    //             color: ThemeProvider.greyColor),
                                    //         border: InputBorder.none,
                                    //         labelText: "Your Latitude".tr,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8),
                                    //   child: Container(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 16),
                                    //     decoration: textFieldDecoration(),
                                    //     child: TextFormField(
                                    //       controller: value.lng,
                                    //       keyboardType: TextInputType.number,
                                    //       cursorColor: ThemeProvider.appColor,
                                    //       decoration: InputDecoration(
                                    //         labelStyle: const TextStyle(
                                    //             fontSize: 14,
                                    //             color: ThemeProvider.greyColor),
                                    //         border: InputBorder.none,
                                    //         labelText: "Your Longitude".tr,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: value.cardId,
                                          cursorColor: ThemeProvider.appColor,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ThemeProvider.greyColor),
                                              border: InputBorder.none,
                                              labelText: "ID Card".tr,
                                              suffixIcon: Icon(
                                                CupertinoIcons
                                                    .arrow_down_to_line_alt,
                                                color: ThemeProvider.appColor,
                                              )),
                                          onTap: () {
                                            chooseFile(context, value, "card");
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: textFieldDecoration(),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: value.beautyCertificate,
                                          cursorColor: ThemeProvider.appColor,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ThemeProvider.greyColor),
                                              border: InputBorder.none,
                                              labelText:
                                                  "Upload Beauty Certificate"
                                                      .tr,
                                              suffixIcon: Icon(
                                                CupertinoIcons
                                                    .arrow_down_to_line_alt,
                                                color: ThemeProvider.appColor,
                                              )),
                                          onTap: () {
                                            chooseFile(context, value,
                                                "beautyCertificate");
                                          },
                                        ),
                                      ),
                                    ),

                                    Row(children: [
                                      Checkbox(
                                        activeColor: ThemeProvider.appColor,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        value: value.termCondition,
                                        onChanged: (newValue) {
                                          //Do Something When Value Changes to True Or False
                                          value.termCondition = newValue!;
                                          value.update();
                                        },
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text.rich(
                                            TextSpan(
                                              text:
                                                  'I’ve read and accepted the '
                                                      .tr,
                                              style: TextStyle(fontSize: 14),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        'Terms & conditions'.tr,
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          ThemeProvider
                                                              .blackColor,
                                                    )),
                                                TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                        color: ThemeProvider
                                                            .redColor))
                                                // can add more TextSpans here...
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Checkbox(
                                        activeColor: ThemeProvider.appColor,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        value: value.ageCondition,
                                        onChanged: (newValue) {
                                          value.ageCondition = newValue!;
                                          value.update();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'I am over 18 years old'.tr,
                                            style: TextStyle(fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: ThemeProvider
                                                          .redColor))
                                              // can add more TextSpans here...
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Checkbox(
                                        activeColor: ThemeProvider.appColor,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        value: value.personalInformation,
                                        onChanged: (newValue) {
                                          value.personalInformation = newValue!;
                                          value.update();
                                        },
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                'I would like to receive the latest news, promos, and updates from Bunitas. Bunitas does not share or sell your personal information'
                                                    .tr,
                                            style: TextStyle(fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: ThemeProvider
                                                          .redColor))
                                              // can add more TextSpans here...
                                            ],
                                          ),
                                        ),
                                      )),
                                    ]),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                        onPressed: () {
                                          value.onRegister();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(200, 50),
                                            foregroundColor:
                                                ThemeProvider.whiteColor,
                                            backgroundColor:
                                                ThemeProvider.appColor,
                                            shadowColor:
                                                ThemeProvider.blackColor,
                                            elevation: 3,
                                            shape: (RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            )),
                                            padding: const EdgeInsets.all(0)),
                                        child: Text(
                                          'Submit'.tr,
                                          style: const TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 16,
                                              color: ThemeProvider.whiteColor,
                                              fontFamily: 'bold'),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
        );
      },
    );
  }
}

contentButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(100.0),
    ),
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(229, 52, 1, 255),
        Color.fromARGB(228, 111, 75, 255),
      ],
    ),
  );
}

textFieldDecoration() {
  return BoxDecoration(
    color: ThemeProvider.whiteColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(15.0),
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.deepPurple.withOpacity(0.1),
          offset: const Offset(0, 5),
          blurRadius: 20),
    ],
  );
}

myBoxDecoration() {
  return BoxDecoration(
    color: ThemeProvider.whiteColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(15),
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.deepPurple.withOpacity(0.2),
          offset: const Offset(0, 1),
          blurRadius: 3),
    ],
  );
}

smallText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 11, color: ThemeProvider.greyColor),
  );
}

bodyText1(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: ThemeProvider.blackColor),
  );
}

chooseFile(BuildContext context, SignUpController value, String type) {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text('Choose From'.tr),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: Text('Gallery'.tr),
          onPressed: () {
            Navigator.pop(context);
            value.selectFromGallery('gallery', type);
          },
        ),
        CupertinoActionSheetAction(
          child: Text('Camera'.tr),
          onPressed: () {
            Navigator.pop(context);
            value.selectFromGallery('camera', type);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Cancel'.tr,
            style: const TextStyle(fontFamily: 'bold', color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
