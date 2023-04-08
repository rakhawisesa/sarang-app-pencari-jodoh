import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/glass_card_widget.dart';
import 'package:sarang/src/features/likes_you/domain/user.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/color_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                user.imagePath,
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
        GlassCardWidget(
          user: user,
        ),
      ],
    );
  }
}
