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
import 'package:ultimate_salon_owner_flutter/app/controller/contact_us_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
                top: 40.0, bottom: 20, left: 20, right: 20),
            child: InkWell(
              onTap: () {
                value.saveContacts();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                decoration: contentButtonStyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    value.isLogin.value == true
                        ? const CircularProgressIndicator(
                            color: ThemeProvider.whiteColor,
                          )
                        : Text(
                            'Submit'.tr,
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
          body: CustomScrollView(
            slivers: [
              // SliverAppBar(
              //   backgroundColor: ThemeProvider.appColor,
              //   floating: true,
              //   pinned: true,
              //   snap: false,
              //   elevation: 0,
              //   forceElevated: true,
              //   iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
              //   titleSpacing: 0,
              //   centerTitle: true,
              //   title: Text(
              //     'Contact Us'.tr,
              //     style: ThemeProvider.titleStyle,
              //   ),
              // ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Contact Us'.tr,
                                        style: const TextStyle(
                                            color: ThemeProvider.blackColor,
                                            fontSize: 20,
                                            fontFamily: 'bold'),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    controller: value.nameContact,
                                    decoration: InputDecoration(
                                      hintText: 'Full Name'.tr,
                                      hintStyle: const TextStyle(
                                          color: ThemeProvider.appColor,
                                          fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    controller: value.emailContanct,
                                    decoration: InputDecoration(
                                      hintText: 'Email Address'.tr,
                                      hintStyle: const TextStyle(
                                          color: ThemeProvider.appColor,
                                          fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    maxLines: 5,
                                    controller: value.messageContanct,
                                    decoration: InputDecoration(
                                      hintText: 'Message'.tr,
                                      hintStyle: const TextStyle(
                                          color: ThemeProvider.appColor,
                                          fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
