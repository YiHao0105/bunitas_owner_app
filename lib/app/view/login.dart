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
import 'package:ultimate_salon_owner_flutter/app/controller/login_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/constance.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:ultimate_salon_owner_flutter/app/view/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget getLanguages() {
    return PopupMenuButton(
      onSelected: (value) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: IconButton(
          icon: const Icon(Icons.translate),
          color: ThemeProvider.appColor,
          onPressed: () {},
        ),
      ),
      itemBuilder: (context) => AppConstants.languages
          .map((e) => PopupMenuItem<String>(
                value: e.languageCode.toString(),
                onTap: () {
                  var locale = Locale(e.languageCode.toString());
                  Get.updateLocale(locale);
                  Get.find<LoginController>().saveLanguage(e.languageCode);
                },
                child: Text(e.languageName.toString()),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (value) {
      return Stack(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/p7.jpg'),
              )),
            ),
          ),
          Scaffold(
            backgroundColor: ThemeProvider.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: ThemeProvider.transparent,
              elevation: 0,
              actions: <Widget>[getLanguages()],
            ),
            bottomNavigationBar: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                  height: 500,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: const BoxDecoration(
                    color: ThemeProvider.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Log In Using",
                          style: TextStyle(
                              fontSize: 16, color: ThemeProvider.greyColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 16),
                      decoration: BoxDecoration(
                        color: ThemeProvider.whiteColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.1),
                              offset: const Offset(0, 0),
                              blurRadius: 5),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          hint: Text(
                            value.loginType,
                            style: TextStyle(
                                fontSize: 15, color: ThemeProvider.greyColor),
                          ),
                          // icon: Icon(Icons.arrow_downward)
                          underline: const SizedBox(),
                          isExpanded: true,
                          iconSize: 24,

                          style: TextStyle(color: Colors.deepPurple),
                          iconDisabledColor: ThemeProvider.appColor,
                          iconEnabledColor: ThemeProvider.appColor,
                          onChanged: (newValue) {
                            value.loginType = newValue.toString();
                            if (value.loginType == "Phone Number") {
                              value.loginVersion = 1;
                            } else if (value.loginType == "Email Address") {
                              value.loginVersion = 0;
                            }
                            value.update();
                          },
                          items: <String>['Phone Number', 'Email Address']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    value.loginVersion == 0
                        ? Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 30),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Welcome'.tr,
                              //         style: const TextStyle(
                              //             color: ThemeProvider.blackColor,
                              //             fontSize: 17),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 10),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Login With Your Account'.tr,
                              //         style: const TextStyle(
                              //             color: ThemeProvider.greyColor,
                              //             fontSize: 13),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: value.emailTextEditor,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address'.tr,
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 8.0, top: 14.0),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeProvider.appColor),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    textInputAction: TextInputAction.done,
                                    controller: value.passwordTextEditor,
                                    obscureText:
                                        value.passwordVisible.value == true
                                            ? false
                                            : true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ThemeProvider.whiteColor,
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
                                      labelText: 'Password'.tr,
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 8.0, top: 14.0),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ThemeProvider.appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        value.onForgot();
                                      },
                                      child: Text(
                                        'Forgot Password?'.tr,
                                        style: const TextStyle(
                                            color: ThemeProvider.appColor,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: InkWell(
                                  onTap: () {
                                    value.onLogin();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13.0),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        color: ThemeProvider.appColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'LOG IN'.tr,
                                          style: const TextStyle(
                                              color: ThemeProvider.whiteColor,
                                              fontSize: 17,
                                              fontFamily: 'bold'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have account ?".tr,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        value.onSignUp();
                                      },
                                      child: Text(
                                        "Sign Up".tr,
                                        style: const TextStyle(
                                            color: ThemeProvider.appColor,
                                            fontFamily: 'bold',
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )

                        // ? Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 30),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'Welcome'.tr,
                        //               style: const TextStyle(
                        //                   color: ThemeProvider.blackColor,
                        //                   fontSize: 17),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 10),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'Login With Your Account'.tr,
                        //               style: const TextStyle(
                        //                   color: ThemeProvider.greyColor,
                        //                   fontSize: 13),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 5),
                        //         child: SizedBox(
                        //           width: double.infinity,
                        //           child: TextField(
                        //             controller: value.emailTextEditor,
                        //             decoration: InputDecoration(
                        //               filled: true,
                        //               fillColor: ThemeProvider.whiteColor,
                        //               hintText: 'Email ID'.tr,
                        //               hintStyle: const TextStyle(
                        //                   color: ThemeProvider.greyColor,
                        //                   fontSize: 12),
                        //               contentPadding: const EdgeInsets.only(
                        //                   bottom: 8.0, top: 14.0, left: 20),
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(100),
                        //                 borderSide: const BorderSide(
                        //                     color: ThemeProvider.appColor),
                        //               ),
                        //               enabledBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(100),
                        //                   borderSide: const BorderSide(
                        //                       color: ThemeProvider.appColor)),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 5),
                        //         child: SizedBox(
                        //           width: double.infinity,
                        //           child: TextField(
                        //             controller: value.passwordTextEditor,
                        //             obscureText: value.passwordVisible.value == true
                        //                 ? false
                        //                 : true,
                        //             decoration: InputDecoration(
                        //               filled: true,
                        //               fillColor: ThemeProvider.whiteColor,
                        //               suffixIcon: InkWell(
                        //                 onTap: () {
                        //                   value.togglePassword();
                        //                 },
                        //                 child: Icon(
                        //                   value.passwordVisible.value == false
                        //                       ? Icons.visibility
                        //                       : Icons.visibility_off,
                        //                   color: ThemeProvider.appColor,
                        //                 ),
                        //               ),
                        //               hintText: 'Password'.tr,
                        //               hintStyle: const TextStyle(
                        //                   color: ThemeProvider.greyColor,
                        //                   fontSize: 12),
                        //               contentPadding: const EdgeInsets.only(
                        //                   bottom: 8.0,
                        //                   top: 14.0,
                        //                   left: 20,
                        //                   right: 20),
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(100),
                        //                 borderSide: const BorderSide(
                        //                     color: ThemeProvider.appColor),
                        //               ),
                        //               enabledBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(100),
                        //                   borderSide: const BorderSide(
                        //                       color: ThemeProvider.appColor)),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 10),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             InkWell(
                        //               onTap: () {
                        //                 value.onForgot();
                        //               },
                        //               child: Text(
                        //                 'Forgot Password?'.tr,
                        //                 style: const TextStyle(
                        //                     color: ThemeProvider.blackColor,
                        //                     fontSize: 13),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 20),
                        //         child: InkWell(
                        //           onTap: () {
                        //             value.onLogin();
                        //           },
                        //           child: Container(
                        //             width: double.infinity,
                        //             padding:
                        //                 const EdgeInsets.symmetric(vertical: 13.0),
                        //             decoration: const BoxDecoration(
                        //                 borderRadius: BorderRadius.all(
                        //                   Radius.circular(15.0),
                        //                 ),
                        //                 color: ThemeProvider.appColor),
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(
                        //                   'LOG IN'.tr,
                        //                   style: const TextStyle(
                        //                       color: ThemeProvider.whiteColor,
                        //                       fontSize: 17,
                        //                       fontFamily: 'bold'),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 10),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             InkWell(
                        //               onTap: () {
                        //                 value.onSignUp();
                        //               },
                        //               child: Text(
                        //                 "Don't have an Account? Sign Up".tr,
                        //                 style: const TextStyle(
                        //                     color: ThemeProvider.greyColor,
                        //                     fontSize: 13),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   )
                        : value.loginVersion == 1
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 30),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         'Welcome'.tr,
                                  //         style: const TextStyle(
                                  //             color: ThemeProvider.blackColor,
                                  //             fontSize: 17),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsets.symmetric(vertical: 10),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         'Login With Your Account'.tr,
                                  //         style: const TextStyle(
                                  //             color: ThemeProvider.greyColor,
                                  //             fontSize: 13),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: CountryCodePicker(
                                              onChanged: (e) =>
                                                  value.updateCountryCode(
                                                      e.dialCode.toString()),
                                              initialSelection: 'GB',
                                              favorite: const ['+44', 'GB'],
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                            )),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: TextFormField(
                                              controller: value.mobileNo,
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelText: 'Phone Number'.tr,
                                                filled: true,
                                                fillColor:
                                                    ThemeProvider.whiteColor,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 8.0, top: 14.0),
                                                focusedBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ThemeProvider
                                                          .appColor),
                                                ),
                                                enabledBorder:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextField(
                                        textInputAction: TextInputAction.done,
                                        controller: value.passwordTextEditor,
                                        obscureText:
                                            value.passwordVisible.value == true
                                                ? false
                                                : true,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: ThemeProvider.whiteColor,
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              value.togglePassword();
                                            },
                                            child: Icon(
                                              value.passwordVisible.value ==
                                                      false
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: ThemeProvider.appColor,
                                            ),
                                          ),
                                          labelText: 'Password'.tr,
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 8.0, top: 14.0),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ThemeProvider.appColor),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            value.onForgot();
                                          },
                                          child: Text(
                                            'Forgot Password?'.tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.appColor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: InkWell(
                                      onTap: () {
                                        value.loginWithPhonePassword();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 13.0),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            color: ThemeProvider.appColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'LOG IN'.tr,
                                              style: const TextStyle(
                                                  color:
                                                      ThemeProvider.whiteColor,
                                                  fontSize: 17,
                                                  fontFamily: 'bold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have account ?".tr,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            value.onSignUp();
                                          },
                                          child: Text(
                                            "Sign Up".tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.appColor,
                                                fontFamily: 'bold',
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Welcome'.tr,
                                          style: const TextStyle(
                                              color: ThemeProvider.blackColor,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Login With Your Account'.tr,
                                          style: const TextStyle(
                                              color: ThemeProvider.greyColor,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: CountryCodePicker(
                                              onChanged: (e) =>
                                                  value.updateCountryCode(
                                                      e.dialCode.toString()),
                                              initialSelection: 'IN',
                                              favorite: const ['+91', 'IN'],
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                            )),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: TextFormField(
                                              controller: value.mobileNo,
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    ThemeProvider.whiteColor,
                                                labelText: 'Mobile Number'.tr,
                                                hintStyle: const TextStyle(
                                                    color:
                                                        ThemeProvider.greyColor,
                                                    fontSize: 12),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 8.0,
                                                        top: 14.0,
                                                        left: 20),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  borderSide: const BorderSide(
                                                      color: ThemeProvider
                                                          .appColor),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: ThemeProvider
                                                                .appColor)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            value.onForgot();
                                          },
                                          child: Text(
                                            'Forgot Password?'.tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.blackColor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: InkWell(
                                      onTap: () {
                                        value.loginWithPhoneOTP();
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
                                              'LOG IN'.tr,
                                              style: const TextStyle(
                                                  color:
                                                      ThemeProvider.whiteColor,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            value.onSignUp();
                                          },
                                          child: Text(
                                            "Don't have an Account? Sign Up".tr,
                                            style: const TextStyle(
                                                color: ThemeProvider.greyColor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                  ])),
            ),
          ),
        ],
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
