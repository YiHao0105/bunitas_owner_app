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
import 'package:ultimate_salon_owner_flutter/app/controller/profile_categories_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

class ProfileCategoriesScreen extends StatefulWidget {
  const ProfileCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCategoriesScreen> createState() => _ProfileCategoriesState();
}

class _ProfileCategoriesState extends State<ProfileCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCategoriesController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          body: value.apiCalled == false
              ? const Center(
                  child:
                      CircularProgressIndicator(color: ThemeProvider.appColor),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 135,
                        margin: const EdgeInsets.only(bottom: 50),

                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //       image: AssetImage('assets/images/h4.jpg'),
                        //       fit: BoxFit.cover),
                        // ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
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
                                            'Edit Profile'.tr,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      ThemeProvider.whiteColor),
                                              child: IconButton(
                                                icon: Icon(Icons.arrow_back),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              )),
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      ThemeProvider.whiteColor),
                                              child: IconButton(
                                                icon:
                                                    Icon(CupertinoIcons.pencil),
                                                onPressed: () {
                                                  selectImage(value, context,
                                                      "background");
                                                },
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            // color: ThemeProvider.transparent,
                            // height: 300,
                            // width: double.infinity,
                            // child: FadeInImage(
                            //   image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.background}'),
                            //   placeholder: const AssetImage("assets/images/h4.jpg"),
                            //   imageErrorBuilder: (context, error, stackTrace) {
                            //     return Image.asset(
                            //       'assets/images/h4.jpg',
                            //       fit: BoxFit.cover,
                            //       height: 40,
                            //       width: 40,
                            //     );
                            //   },
                            //   fit: BoxFit.cover,
                            //   height: 40,
                            //   width: 40,
                            // )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Align(
                                //   alignment: Alignment.topLeft,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 50, left: 10),
                                //     child: Row(
                                //       children: [
                                //         IconButton(
                                //           onPressed: () {
                                //             Get.back();
                                //           },
                                //           icon: const Icon(
                                //             Icons.arrow_back,
                                //             color: ThemeProvider.whiteColor,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         vertical: 50, horizontal: 20),
                                //     child: CircleAvatar(
                                //       backgroundColor: ThemeProvider.appColor,
                                //       child: IconButton(
                                //         onPressed: () {
                                //           selectImage(
                                //               value, context, "background");
                                //         },
                                //         icon: const Icon(
                                //           Icons.edit,
                                //           color: ThemeProvider.whiteColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(top: 45, right: 10),
                                //     child: Row(
                                //       children: [
                                //         IconButton(
                                //           onPressed: () {
                                //             selectImage(value, context, "background");
                                //           },
                                //           icon: const Icon(
                                //             Icons.cloud_upload,
                                //             color: ThemeProvider.whiteColor,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Positioned(
                              bottom: -60,
                              child: GestureDetector(
                                onTap: () {
                                  selectImage(value, context, "profile");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ThemeProvider.appColor,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(40),
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            '${Environments.apiBaseURL}storage/images/${value.cover}'),
                                        placeholder: const AssetImage(
                                            "assets/images/placeholder.jpeg"),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/notfound.png',
                                            fit: BoxFit.cover,
                                            height: 40,
                                            width: 40,
                                          );
                                        },
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 10),
                            //   child: Container(
                            //     width: double.infinity,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       border: Border.all(
                            //           color: ThemeProvider.appColor,
                            //           style: BorderStyle.solid),
                            //     ),
                            //     child: InkWell(
                            //       onTap: () {
                            //         value.onSelectCategories();
                            //       },
                            //       child: Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20.0, vertical: 11),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: List.generate(
                            //                 value.profileInfo.webCatesData!
                            //                     .length,
                            //                 (index) => Column(
                            //                   children: [
                            //                     Text(
                            //                       value.profileInfo
                            //                           .webCatesData![index].name
                            //                           .toString(),
                            //                       style: const TextStyle(
                            //                           fontSize: 17),
                            //                     ),
                            //                     // if (index !=
                            //                     //     (value.profileInfo.webCatesData!
                            //                     //             .length -
                            //                     //         1))
                            //                     //   const Text(',')
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //             const Icon(
                            //               Icons.chevron_right,
                            //               color: ThemeProvider.greyColor,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  controller: value.salonNameTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Business Name'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.aboutTextEditor,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Description of Business'.tr,
                                    hintStyle: const TextStyle(
                                        color: ThemeProvider.greyColor,
                                        fontSize: 12),
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 8.0, top: 14.0, left: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: ThemeProvider.appColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.addressTextEditor,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Address'.tr,
                                    hintStyle: const TextStyle(
                                        color: ThemeProvider.greyColor,
                                        fontSize: 12),
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 8.0, top: 14.0, left: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: ThemeProvider.appColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: ThemeProvider.appColor)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                      color: ThemeProvider.appColor,
                                      style: BorderStyle.solid),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    value.onSelectCities();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 11),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          value.profileInfo.cityData!.name
                                                          .toString() ==
                                                      '' ||
                                                  value.profileInfo.cityData!
                                                      .name!.isEmpty
                                              ? 'Select'.tr
                                              : value.profileInfo.cityData!.name
                                                  .toString(),
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                        const Icon(
                                          Icons.expand_more,
                                          color: ThemeProvider.greyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  controller: value.zipCodeTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'ZIP Code'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.facebookTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Facebook'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.instagramTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Instagram'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.youtubeTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Youtube'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  textInputAction: TextInputAction.done,
                                  controller: value.tiktokTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Tik Tok'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: const BorderSide(
                                            color: ThemeProvider.appColor)),
                                  ),
                                ),
                              ),
                            ),

                            //===========commented by @Geek=============//

                            /*Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextField(
                                  controller: value.latTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Latitude'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(100),
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
                                  controller: value.lngTextEditor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ThemeProvider.whiteColor,
                                    hintText: 'Longitude'.tr,
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        borderSide: const BorderSide(
                                            color: ThemeProvider.appColor)),
                                  ),
                                ),
                              ),
                            ),*/

                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Number of Staffs'.tr,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 70,
                                    child: TextField(
                                      textInputAction: TextInputAction.done,
                                      controller: value.doYouHaveTextEditor,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ThemeProvider.whiteColor,
                                        hintText: 'staff'.tr,
                                        hintStyle: const TextStyle(
                                            color: ThemeProvider.greyColor,
                                            fontSize: 12),
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 8.0, top: 14.0, left: 20),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: ThemeProvider.appColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ThemeProvider.appColor)),
                                      ),
                                    ),
                                  ),

                                  //Commented By Geeks
                                  /* value.haveStylist
                                      ? Container(
                                          height: 35,
                                          width: 70,
                                          child: TextField(
                                            textInputAction: TextInputAction.done,
                                            controller: value.doYouHaveTextEditor,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: ThemeProvider.whiteColor,
                                              hintText: 'staff'.tr,
                                              hintStyle: const TextStyle(color: ThemeProvider.greyColor, fontSize: 12),
                                              contentPadding: const EdgeInsets.only(bottom: 8.0, top: 14.0, left: 20),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: const BorderSide(color: ThemeProvider.appColor),
                                              ),
                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: ThemeProvider.appColor)),
                                            ),
                                          ),
                                        )
                                      : SizedBox(height: 7),*/
                                  // Switch(
                                  //   value: value.haveStylist,
                                  //   onChanged: (bool status) {
                                  //     value.updateStylist(status);
                                  //   },
                                  //   activeColor: ThemeProvider.greenColor,
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Selling Products'.tr,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Switch(
                                    value: value.haveShop,
                                    onChanged: (bool status) {
                                      value.updateShop(status);
                                    },
                                    activeColor: ThemeProvider.greenColor,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Providing Home Service'.tr,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Switch(
                                    value: value.haveHome,
                                    onChanged: (bool status) {
                                      value.updateHome(status);
                                    },
                                    activeColor: ThemeProvider.greenColor,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Opening Hour'.tr,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'bold',
                                        color: ThemeProvider.blackColor),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      value.onAddNewTiming();
                                    },
                                    child: const Icon(
                                      Icons.add_circle,
                                      color: ThemeProvider.appColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: List.generate(
                                value.timesList.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.circle,
                                          color: ThemeProvider.greenColor,
                                          size: 15),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                value.getDayName(value
                                                    .timesList[index]
                                                    .day as int),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color:
                                                        ThemeProvider.appColor,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              '${value.timesList[index].openTime} - ${value.timesList[index].closeTime}',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color:
                                                      ThemeProvider.blackColor,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: 23.0,
                                              width: 70,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ThemeProvider
                                                            .orangeColor),
                                                onPressed: () {
                                                  value.onEditTime(
                                                      value.getDayName(value
                                                          .timesList[index]
                                                          .day as int),
                                                      value.timesList[index]
                                                          .openTime
                                                          .toString(),
                                                      value.timesList[index]
                                                          .closeTime
                                                          .toString(),
                                                      index);
                                                },
                                                child: Text(
                                                  'Edit'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'bold'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
              onTap: () {
                value.updateSalon();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                decoration: contentButtonStyle(),
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
              ),
            ),
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

selectImage(
    ProfileCategoriesController value, BuildContext context, String type) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text('Choose From'.tr),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
            value.selectFromGallery('camera', type);
          },
          child: Text('Camera'.tr),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            value.selectFromGallery('gallery', type);
          },
          child: Text('Gallery'.tr),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'.tr),
        )
      ],
    ),
  );
}
