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
import 'package:ultimate_salon_owner_flutter/app/controller/profile_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:ultimate_salon_owner_flutter/app/env.dart';
import 'package:ultimate_salon_owner_flutter/app/view/inbox.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          body:
              // SliverAppBar(
              //   backgroundColor: ThemeProvider.backgroundColor,
              //   floating: true,
              //   pinned: true,
              //   toolbarHeight: 308,
              //   snap: false,
              //   elevation: 0,
              //   forceElevated: true,
              //   iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
              //   automaticallyImplyLeading: false,
              //   titleSpacing: 0,
              //   title: Column(
              //     children: [
              //       Container(
              //         height: 200,
              //         margin: const EdgeInsets.only(bottom: 50),
              //         // decoration: ,
              //         child: Stack(
              //           clipBehavior: Clip.none,
              //           alignment: Alignment.center,
              //           children: [
              //             Container(
              //               height: 200,
              //               width: double.infinity,
              //               decoration: value.parser.getBackground() == 'NA'
              //                   ? const BoxDecoration(
              //                       image: DecorationImage(
              //                           image:
              //                               AssetImage('assets/images/h4.jpg'),
              //                           fit: BoxFit.cover),
              //                     )
              //                   : const BoxDecoration(),
              //               child: value.parser.getBackground() == 'NA'
              //                   ? const SizedBox()
              //                   : FadeInImage(
              //                       image: NetworkImage(
              //                           '${Environments.apiBaseURL}storage/images/${value.parser.getBackground().toString()}'),
              //                       placeholder: const AssetImage(
              //                           "assets/images/placeholder.jpeg"),
              //                       imageErrorBuilder:
              //                           (context, error, stackTrace) {
              //                         return Image.asset(
              //                           'assets/images/notfound.png',
              //                           fit: BoxFit.cover,
              //                           height: 40,
              //                           width: 40,
              //                         );
              //                       },
              //                       fit: BoxFit.cover,
              //                       height: 40,
              //                       width: 40,
              //                     ),
              //             ),
              //             Positioned(
              //               bottom: -40,
              //               child: Container(
              //                 padding: const EdgeInsets.all(3),
              //                 decoration: BoxDecoration(
              //                   color: ThemeProvider.whiteColor,
              //                   border: Border.all(
              //                       color: ThemeProvider.appColor, width: 3),
              //                   borderRadius: BorderRadius.circular(100),
              //                 ),
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(100),
              //                   child: SizedBox.fromSize(
              //                     size: const Size.fromRadius(40),
              //                     child: FadeInImage(
              //                       image: NetworkImage(
              //                           '${Environments.apiBaseURL}storage/images/${value.parser.getCover().toString()}'),
              //                       placeholder: const AssetImage(
              //                           "assets/images/placeholder.jpeg"),
              //                       imageErrorBuilder:
              //                           (context, error, stackTrace) {
              //                         return Image.asset(
              //                           'assets/images/notfound.png',
              //                           fit: BoxFit.cover,
              //                           height: 40,
              //                           width: 40,
              //                         );
              //                       },
              //                       fit: BoxFit.cover,
              //                       height: 40,
              //                       width: 40,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Text(
              //         value.parser.getName(),
              //         style: const TextStyle(
              //             fontFamily: 'bold', color: ThemeProvider.blackColor),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 5),
              //         child: RichText(
              //           text: TextSpan(
              //             children: [
              //               TextSpan(
              //                 text:
              //                     '(${value.parser.getTotalRating()}${' Reviews) '.tr}',
              //                 style: const TextStyle(
              //                     fontSize: 12, color: ThemeProvider.greyColor),
              //               ),
              //               WidgetSpan(
              //                 child: Icon(Icons.star,
              //                     size: 15,
              //                     color: value.parser.getRating() >= 1
              //                         ? ThemeProvider.orangeColor
              //                         : ThemeProvider.greyColor),
              //               ),
              //               WidgetSpan(
              //                 child: Icon(Icons.star,
              //                     size: 15,
              //                     color: value.parser.getRating() >= 2
              //                         ? ThemeProvider.orangeColor
              //                         : ThemeProvider.greyColor),
              //               ),
              //               WidgetSpan(
              //                 child: Icon(Icons.star,
              //                     size: 15,
              //                     color: value.parser.getRating() >= 3
              //                         ? ThemeProvider.orangeColor
              //                         : ThemeProvider.greyColor),
              //               ),
              //               WidgetSpan(
              //                 child: Icon(Icons.star,
              //                     size: 15,
              //                     color: value.parser.getRating() >= 4
              //                         ? ThemeProvider.orangeColor
              //                         : ThemeProvider.greyColor),
              //               ),
              //               WidgetSpan(
              //                 child: Icon(Icons.star,
              //                     size: 15,
              //                     color: value.parser.getRating() >= 5
              //                         ? ThemeProvider.orangeColor
              //                         : ThemeProvider.greyColor),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              //   bottom: PreferredSize(
              //     preferredSize: const Size.fromHeight(56),
              //     child: AppBar(
              //       titleSpacing: 0,
              //       automaticallyImplyLeading: false,
              //       elevation: 0,
              //       backgroundColor: ThemeProvider.backgroundColor,
              //       title: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: Text(
              //           'Your Profile'.tr,
              //           style: const TextStyle(
              //               fontFamily: 'bold',
              //               fontSize: 14,
              //               color: ThemeProvider.blackColor),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Stack(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Profile'.tr,
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
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Container(
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         color: ThemeProvider.whiteColor),
                                //     child: IconButton(
                                //       icon: Icon(Icons.arrow_back),
                                //       onPressed: () {
                                //         Get.back();
                                //       },
                                //     )),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ThemeProvider.whiteColor),
                                    child: IconButton(
                                      icon: Icon(CupertinoIcons.pencil),
                                      onPressed: () {},
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Obx(() => Container(
                                  padding: const EdgeInsets.all(10),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ThemeProvider.whiteColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              value.onEditProfile();
                                            },
                                            child: _buildList(
                                                Icons.edit_outlined,
                                                'Edit Profile'.tr),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              value.onGallary();
                                            },
                                            child: _buildList(
                                                Icons.image_outlined,
                                                'Gallery'.tr),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          value.subType == "Products Only"
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    value.onServices();
                                                  },
                                                  child: _buildList(
                                                      Icons.access_time,
                                                      'Treatments'.tr),
                                                ),
                                          value.subType == "Products Only"
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    value.onPackages();
                                                  },
                                                  child: _buildList(
                                                      Icons
                                                          .receipt_long_outlined,
                                                      'Bundles'.tr),
                                                ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          value.subType == "Products Only"
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    value.onSlot();
                                                  },
                                                  child: _buildList(
                                                      Icons.access_time,
                                                      'Availability'.tr),
                                                ),
                                          //Commented by GeekTech
                                          InkWell(
                                            onTap: () {
                                              value.onInbox();
                                            },
                                            child: _buildList(
                                                Icons.chat_outlined,
                                                'Chats'.tr),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          value.subType == "Products Only"
                                              ? Container()
                                              : value.type == true
                                                  ? InkWell(
                                                      onTap: () {
                                                        value.onStylist();
                                                      },
                                                      child: _buildList(
                                                          Icons.style_outlined,
                                                          'Manage Staffs'.tr),
                                                    )
                                                  : const SizedBox(),
                                          value.haveShop.value == "1"
                                              ? InkWell(
                                                  onTap: () {
                                                    value.onProducts();
                                                  },
                                                  child: _buildList(
                                                      Icons.list_alt,
                                                      'Manage Products'.tr),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              value.onHistory();
                                            },
                                            child: _buildList(Icons.history,
                                                'Order History'.tr),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              value.onReview();
                                            },
                                            child: _buildList(
                                                Icons.rate_review_outlined,
                                                'Review'.tr),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              value.onPolicy();
                                            },
                                            child: _buildList(
                                                Icons.language, 'Policy'.tr),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              value.onLanguages();
                                            },
                                            child: _buildList(
                                                Icons.language, 'Languages'.tr),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              value.onContactUs();
                                            },
                                            child: _buildList(
                                                Icons.contact_page_outlined,
                                                'Contact Us'.tr),
                                          ),
                                          value.subType == "Products Only"
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    value.onAppPages(
                                                        'FAQs'.tr, '5');
                                                  },
                                                  child: _buildList(
                                                      Icons.flag_outlined,
                                                      'FAQs'.tr),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),

                            // InkWell(
                            //   onTap: () {
                            //     value.onAppPages('Help'.tr, '6');
                            //   },
                            //   child: _buildList(
                            //       Icons.help_outline, 'Help'.tr),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                value.subType == "Products Only"
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          value.onAppPages(
                                              'Privacy Policy'.tr, '2');
                                        },
                                        child: _buildList(
                                            Icons.security_outlined,
                                            'Privacy Policy'.tr),
                                      ),
                                value.subType == "Products Only"
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          value.onAppPages(
                                              'Terms & Conditions'.tr, '3');
                                        },
                                        child: _buildList(
                                            Icons.privacy_tip_outlined,
                                            'Terms & Conditions'.tr),
                                      ),
                              ],
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     value.onAppPages('About us'.tr, '1');
                            //   },
                            //   child: _buildList(
                            //       Icons.info_outline, 'About'.tr),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    value.onLogout();
                                  },
                                  child: _buildList(Icons.logout, 'Logout'.tr),
                                ),
                                Container(
                                  height: 120,
                                  width: 135,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 50),
                    // decoration: ,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: -40,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: ThemeProvider.whiteColor,
                              border: Border.all(
                                  color: ThemeProvider.appColor, width: 3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(40),
                                child: FadeInImage(
                                  image: NetworkImage(
                                      '${Environments.apiBaseURL}storage/images/${value.parser.getCover().toString()}'),
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
                      ],
                    ),
                  ),
                  Text(
                    value.parser.getName(),
                    style: const TextStyle(
                        fontFamily: 'bold', color: ThemeProvider.blackColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '(${value.parser.getTotalRating()}${' Reviews) '.tr}',
                            style: const TextStyle(
                                fontSize: 12, color: ThemeProvider.greyColor),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 15,
                                color: value.parser.getRating() >= 1
                                    ? ThemeProvider.orangeColor
                                    : ThemeProvider.greyColor),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 15,
                                color: value.parser.getRating() >= 2
                                    ? ThemeProvider.orangeColor
                                    : ThemeProvider.greyColor),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 15,
                                color: value.parser.getRating() >= 3
                                    ? ThemeProvider.orangeColor
                                    : ThemeProvider.greyColor),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 15,
                                color: value.parser.getRating() >= 4
                                    ? ThemeProvider.orangeColor
                                    : ThemeProvider.greyColor),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 15,
                                color: value.parser.getRating() >= 5
                                    ? ThemeProvider.orangeColor
                                    : ThemeProvider.greyColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildList(icn, txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 120,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeProvider.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeProvider.appColor.withOpacity(0.2),
              blurRadius: 25.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [ThemeProvider.whiteColor, Colors.deepPurple.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Icon(
                icn,
                color: ThemeProvider.appColor,
              ),
            ),
            // const SizedBox(width: 10),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child:
            Positioned(
              top: 80,
              child: Text(
                '$txt',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 9, fontFamily: 'bold'),
              ),
            ),
            //       ),
            //       const Icon(Icons.chevron_right),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url =
        Uri.parse('https://legal.bunitas.com/bunitas-privacy-policy');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
