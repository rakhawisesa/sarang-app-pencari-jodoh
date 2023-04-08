import 'package:flutter/material.dart';
import 'package:sarang/src/features/likes_you/domain/user.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p24,
        right: AppPadding.p36,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle().copyWith(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          Text(
            "${user.age}, ${user.occupation}",
            style: getBlack30TextStyle().copyWith(
              fontSize: FontSizeManager.f16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle().copyWith(
              fontSize: FontSizeManager.f16,
            ),
          )
        ],
      ),
    );
  }
}
