import 'package:flutter/material.dart';
import 'package:sarang/src/features/likes_you/domain/user.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    user.fullName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: getWhiteTextStyle().copyWith(
                      fontSize: FontSizeManager.f20,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                  ),
                  Text(
                    "${user.age}, ${user.occupation}",
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
    );
  }
}
