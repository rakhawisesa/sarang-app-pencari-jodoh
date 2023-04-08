import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/match_button_widget.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "${AssetImageIconManager.assetPath}people_love_1.png",
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
                onTap: () {},
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
                onTap: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
