import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:ultimate_salon_owner_flutter/app/helper/router.dart';
import 'package:ultimate_salon_owner_flutter/app/util/theme.dart';


class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.backgroundColor,
      body: Stack(
        children: [
          IntroductionSlider(
            items: [
              IntroductionSliderItem(
                logo: Image.asset(
                  "assets/images/intro_image_1.jpg",
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SvgPicture.asset(
                    "assets/images/local_hairdresser.svg",
                  ),
                ),
              ),
              IntroductionSliderItem(
                logo: Image.asset(
                  "assets/images/intro_image_2.jpg",
                ),
                title: SvgPicture.asset("assets/images/get_the_best_deals.svg"),
              ),
              IntroductionSliderItem(
                logo: Image.asset(
                  "assets/images/intro_image_3.jpg",
                ),
                title:
                    SvgPicture.asset("assets/images/buy_trending_products.svg"),
              ),
            ],
            done: Done(
                child: InkWell(
                  onTap: () => Get.offNamed(AppRouter.getInitialRoute()),
                  child: Text("Get started",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeProvider.appColor)),
                ),
                home: null),
            next: Next(
                child: Text(
              "Next",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeProvider.appColor),
            )),
            back: Back(
                child: Text("Previous",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ThemeProvider.greyColor))),
            dotIndicator: DotIndicator(
                selectedColor: ThemeProvider.appColor,
                unselectedColor: ThemeProvider.greyColor),
          ),
          Positioned(
            top: 0,
            left: Get.width - 190,
            child: const Image(
              image: AssetImage('assets/images/language_icon_curve.png'),
              alignment: Alignment.center,
            ), //CircularAvatar
          ),
          Positioned(
            top: 35,
            left: Get.width - 100,
            child: const Image(
              image: AssetImage('assets/images/select_language.png'),
              height: 80,
              width: 80,
              alignment: Alignment.center,
            ), //CircularAvatar
          ),
        ],
      ),
    );
  }
}
