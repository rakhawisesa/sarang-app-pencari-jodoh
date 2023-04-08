import 'package:flutter/material.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({
    super.key,
  });

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
            "Shayna",
            style: getWhiteTextStyle().copyWith(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          Text(
            "22, Lawyer",
            style: getBlack30TextStyle().copyWith(
              fontSize: FontSizeManager.f16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "I love solving problem in terms of finance, business, and any case. With you, we will solve all world problems.",
            style: getWhiteTextStyle().copyWith(
              fontSize: FontSizeManager.f16,
            ),
          )
        ],
      ),
    );
  }
}
