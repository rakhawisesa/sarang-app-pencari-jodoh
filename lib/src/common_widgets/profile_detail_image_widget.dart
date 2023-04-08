import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/match_button_widget.dart';
import 'package:sarang/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({
    super.key,
    required this.imagePath,
  });

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p40,
            horizontal: AppPadding.p24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                dimension: 22,
                iconPath: "icon_back.png",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Lover Profile\nDetails",
                textAlign: TextAlign.center,
                style: getWhiteTextStyle().copyWith(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              MatchButtonWidget(
                dimension: 22,
                iconPath: "icon_close_small.png",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ExplorePeopleScreen.routeName,
                    (route) => false,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
