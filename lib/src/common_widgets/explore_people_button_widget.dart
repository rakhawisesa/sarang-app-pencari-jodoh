import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/match_button_widget.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({
    super.key,
    required this.controller,
  });

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: "icon_close.png",
          onTap: () {
            controller.swipeLeft();
          },
        ),
        MatchButtonWidget(
          iconPath: "icon_love.png",
          onTap: () {
            controller.swipeUp();
          },
          dimension: 80.0,
        ),
        MatchButtonWidget(
          iconPath: "icon_favorite.png",
          onTap: () {
            controller.swipeRight();
          },
        ),
      ],
    );
  }
}
