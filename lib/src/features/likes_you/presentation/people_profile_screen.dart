import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/custom_button_widget.dart';
import 'package:sarang/src/common_widgets/people_identity_widget.dart';
import 'package:sarang/src/common_widgets/profile_detail_image_widget.dart';
import 'package:sarang/src/features/likes_you/domain/user.dart';
import 'package:sarang/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class PeopleProfileScreen extends StatelessWidget {
  const PeopleProfileScreen({super.key});

  static const String routeName = "/people-profile";

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileDetailImageWidget(
              imagePath: user.imagePath,
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            PeopleIdentityWidget(
              user: user,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: AppMargin.m24),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    height: 80,
                    margin: const EdgeInsets.only(
                      right: AppMargin.m16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSize.s18,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "${AssetImageIconManager.assetPath}icon_hobby_1.png",
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
              ),
              child: CustomButtonWidget(
                title: "Chat Now",
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
          ],
        ),
      ),
    );
  }
}
