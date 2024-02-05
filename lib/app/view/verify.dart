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
import 'package:ultimate_salon_owner_flutter/app/controller/verify_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyController>(builder: (value) {
      return AbsorbPointer(
        absorbing: value.isLogin.value == false ? false : true,
        child: Scaffold(
          backgroundColor: ThemeProvider.backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: value.divNumber == 1
                  ? Column(
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
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reset Password'.tr,
                                      style: const TextStyle(
                                          color: ThemeProvider.blackColor,
                                          fontSize: 20,
                                          fontFamily: 'bold'),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter your email address or phone number and",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                            Text(
                              "we will send a verification code to generate",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                            Text(
                              "a new password",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Email Address",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8),
                            child: TextField(
                              controller: value.emailReset,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ThemeProvider.whiteColor,
                                hintStyle: const TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: 12),
                                contentPadding: const EdgeInsets.only(
                                    bottom: 8.0, top: 14.0, left: 20),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: ThemeProvider.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: ThemeProvider.transparent)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: value.isLogin.value == false
                              ? InkWell(
                                  onTap: () {
                                    value.sendMail();
                                  },
                                  child: Container(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13.0),
                                    decoration: BoxDecoration(
                                        color: ThemeProvider.appColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Send OTP'.tr,
                                          style: const TextStyle(
                                              color: ThemeProvider.whiteColor,
                                              fontSize: 17,
                                              fontFamily: 'bold'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13.0),
                                  decoration: contentButtonStyle(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(
                                        color: ThemeProvider.whiteColor,
                                      )
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text(
                            "Home",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'Generate Password'.tr,
                                style: const TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              controller: value.passwordReset,
                              textInputAction: TextInputAction.done,
                              obscureText: value.passwordVisible.value == true
                                  ? false
                                  : true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ThemeProvider.whiteColor,
                                labelText: 'New Password'.tr,
                                hintStyle: const TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: 12),
                                contentPadding: const EdgeInsets.only(
                                    bottom: 8.0, top: 14.0, left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(
                                      color: ThemeProvider.appColor),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    value.togglePassword();
                                  },
                                  child: Icon(
                                    value.passwordVisible.value == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ThemeProvider.appColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        color: ThemeProvider.appColor)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              controller: value.confirmPasswordReset,
                              textInputAction: TextInputAction.done,
                              obscureText: value.passwordVisible.value == true
                                  ? false
                                  : true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ThemeProvider.whiteColor,
                                labelText: 'Confirm Password'.tr,
                                hintStyle: const TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: 12),
                                contentPadding: const EdgeInsets.only(
                                    bottom: 8.0, top: 14.0, left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(
                                      color: ThemeProvider.appColor),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    value.togglePassword();
                                  },
                                  child: Icon(
                                    value.passwordVisible.value == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ThemeProvider.appColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        color: ThemeProvider.appColor)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: value.isLogin.value == false
                              ? InkWell(
                                  onTap: () {
                                    value.updatePassword();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13.0),
                                    decoration: contentButtonStyle(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Update Password'.tr,
                                          style: const TextStyle(
                                              color: ThemeProvider.whiteColor,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13.0),
                                  decoration: contentButtonStyle(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(
                                        color: ThemeProvider.whiteColor,
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
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
