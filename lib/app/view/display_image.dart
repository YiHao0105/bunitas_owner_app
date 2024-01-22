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
import 'package:ultimate_salon_owner_flutter/app/controller/display_image_controller.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';

import '../env.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({Key? key}) : super(key: key);

  @override
  State<DisplayImage> createState() => _DisplayImage();
}

class _DisplayImage extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisplayController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.backgroundColor,
          body: GestureDetector(
            child: Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.network(
                  '${Environments.apiBaseURL}storage/images/${value.url}',
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}


