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
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:ultimate_salon_owner_flutter/app/controller/tabs_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';
import 'package:ultimate_salon_owner_flutter/app/view/analytics.dart';
import 'package:ultimate_salon_owner_flutter/app/view/appointment.dart';
import 'package:ultimate_salon_owner_flutter/app/view/calendar.dart';
import 'package:ultimate_salon_owner_flutter/app/view/history.dart';
import 'package:ultimate_salon_owner_flutter/app/view/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'inbox.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
//    List<TabItem> items = [
//   TabItem(
//     icon: Icons.home,
//     // title: 'Home',
//   ),
//   TabItem(
//     icon: Icons.search_sharp,
//     title: 'Shop',
//   ),
//   TabItem(
//     icon: Icons.favorite_border,
//     title: 'Wishlist',
//   ),
//   TabItem(
//     icon: Icons.shopping_cart_outlined,
//     title: 'Cart',
//   ),
//   TabItem(
//     icon: Icons.account_box,
//     title: 'profile',
//   ),
// ];
  @override
  Widget build(BuildContext context) {
    List<Widget> pages;
    return GetBuilder<TabsController>(builder: (value) {
      if (value.subType == "Products Only") {
        pages = [
          HistoryScreen(booleanVal: false,),
          AnalyticScreen(),
          CalendarScreen(),
          // InboxScreen(),
          ProfileScreen()
        ];
      } else {
        pages = [
          AppointmentScreen(),
          HistoryScreen(booleanVal: false,),
          AnalyticScreen(),
          CalendarScreen(),
          // InboxScreen(),
          ProfileScreen()
        ];
      }

      return DefaultTabController(
        length: value.subType == "Products Only" ? 4 : 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: MotionTabBar(
            // controller: _motionTabBarController, // Add this controller if you need to change your tab programmatically
            initialSelectedTab: "Appointment",
            useSafeArea: true, // default: true, apply safe area wrapper
            labels: const [
              "Appointment",
              "Orders",
              "Analytics",
              "Calendar",
              "Settings"
            ],
            icons: const [
              Icons.content_paste_outlined,
              Icons.history_outlined,
              Icons.currency_exchange_outlined,
              Icons.calendar_today_outlined,
              Icons.person_outlined
            ],

            // optional badges, length must be same with labels

            tabSize: 40,
            tabBarHeight: 55,
            textStyle: TextStyle(
              fontSize: 9,
              color: Colors.grey.shade600,
            ),

            tabIconColor: ThemeProvider.greyColor,
            tabIconSize: 22.0,
            tabIconSelectedSize: 24.0,
            tabSelectedColor: ThemeProvider.appColor,
            tabIconSelectedColor: Colors.white,
            tabBarColor: Colors.white,
            onTabItemSelected: (int val) {
              value.updateTabId(val);
              // setState(() {
              // _motionTabBarController!.index = value;
              // });
            },
          ),
          // bottomNavigationBar: Container(
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //     child: InkWell(
          //       child: value.subType == "Products Only"
          //           ? (GNav(
          //               rippleColor: ThemeProvider.appColor,
          //               hoverColor: ThemeProvider.appColor,
          //               haptic: false,
          //               curve: Curves.easeOutExpo,
          //               tabBorderRadius: 15,
          //               textStyle: const TextStyle(
          //                   fontSize: 15,
          //                   fontFamily: 'bold',
          //                   color: Colors.white),
          //               duration: const Duration(milliseconds: 300),
          //               gap: 5,
          //               color: Colors.grey.shade400,
          //               activeColor: Colors.white,
          //               iconSize: 20,
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 10, vertical: 5),
          //               tabs: [
          //                 GButton(
          //                   icon: Icons.history_outlined,
          //                   text: 'Orders'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 GButton(
          //                   icon: Icons.currency_exchange_outlined,
          //                   text: 'Earnings'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 GButton(
          //                   icon: Icons.calendar_today_outlined,
          //                   text: 'Calendar'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 // GButton(
          //                 //   icon: Icons.chat_outlined,
          //                 //   text: 'Chat'.tr,
          //                 //   backgroundColor: ThemeProvider.appColor,
          //                 // ),
          //                 GButton(
          //                   icon: Icons.person_outlined,
          //                   text: 'Profile'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //               ],
          //               selectedIndex: value.tabId,
          //               onTabChange: (index) {
          //                 value.updateTabId(index);
          //               },
          //             ))
          //           : (GNav(
          //               rippleColor: ThemeProvider.appColor,
          //               hoverColor: ThemeProvider.appColor,
          //               haptic: false,
          //               curve: Curves.easeOutExpo,
          //               tabBorderRadius: 15,
          //               textStyle: const TextStyle(
          //                   fontSize: 15,
          //                   fontFamily: 'bold',
          //                   color: Colors.white),
          //               duration: const Duration(milliseconds: 300),
          //               gap: 5,
          //               color: Colors.grey.shade400,
          //               activeColor: Colors.white,
          //               iconSize: 20,
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 10, vertical: 5),
          //               tabs: [
          //                 GButton(
          //                   icon: Icons.content_paste_outlined,
          //                   text: 'Appoinment'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 GButton(
          //                   icon: Icons.history_outlined,
          //                   text: 'Orders'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 GButton(
          //                   icon: Icons.currency_exchange_outlined,
          //                   text: 'Earnings'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 GButton(
          //                   icon: Icons.calendar_today_outlined,
          //                   text: 'Calendar'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //                 // GButton(
          //                 //   icon: Icons.chat_outlined,
          //                 //   text: 'Chat'.tr,
          //                 //   backgroundColor: ThemeProvider.appColor,
          //                 // ),
          //                 GButton(
          //                   icon: Icons.person_outlined,
          //                   text: 'Profile'.tr,
          //                   backgroundColor: ThemeProvider.appColor,
          //                 ),
          //               ],
          //               selectedIndex: value.tabId,
          //               onTabChange: (index) {
          //                 value.updateTabId(index);
          //               },
          //             )),
          //     ),
          //   ),
          // ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: value.tabController,
            children: pages,
          ),
        ),
      );
    });
  }
}
