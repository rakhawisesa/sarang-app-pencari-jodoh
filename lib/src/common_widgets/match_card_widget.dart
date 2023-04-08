import 'package:flutter/material.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/color_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "${AssetImageIconManager.assetPath}people_love_2.png",
              ),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 10,
              color: ColorManager.secondary,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: BorderRadius.circular(AppSize.s70),
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.symmetric(
            vertical: AppMargin.m26,
            horizontal: AppMargin.m30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "${AssetImageIconManager.assetPath}glass_card_image.png",
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: AppMargin.m16,
                    left: AppMargin.m24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sabrina Anho andhoni",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getWhiteTextStyle().copyWith(
                          fontSize: FontSizeManager.f20,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                      ),
                      Text(
                        "20, Traveler",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getWhiteTextStyle().copyWith(
                          fontSize: FontSizeManager.f14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                "${AssetImageIconManager.assetPath}icon_profile.png",
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
