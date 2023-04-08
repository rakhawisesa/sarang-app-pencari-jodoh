import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang/src/common_widgets/custom_button_widget.dart';
import 'package:sarang/src/common_widgets/custom_text_button_widget.dart';
import 'package:sarang/src/common_widgets/logo_and_tagline_widget.dart';
import 'package:sarang/src/common_widgets/upload_photo_widget.dart';
import 'package:sarang/src/features/authentication/domain/user_account.dart';
import 'package:sarang/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';
import 'package:sarang/src/utils/image_picker_util.dart';

import 'bloc/auth_bloc.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  const SignUpUploadPhotoScreen({super.key});

  static const String routeName = '/sign-up-upload-photo';

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);

    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              ExplorePeopleScreen.routeName,
              (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndTaglineWidget(),
                const SizedBox(
                  height: AppSize.s50,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color.fromARGB(255, 55, 53, 46),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(AppPadding.p24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  getImageProfile(GetImageFrom.camera);
                                },
                                icon: const Icon(
                                  Icons.camera,
                                  size: AppSize.s50,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  getImageProfile(GetImageFrom.gallery);
                                },
                                icon: const Icon(
                                  Icons.photo,
                                  size: AppSize.s50,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: UploadPhotoWidget(
                    image: image,
                  ),
                ),
                const SizedBox(
                  height: 53.0,
                ),
                Text(
                  userAccount.fullname,
                  style: getWhiteTextStyle().copyWith(
                      fontSize: FontSizeManager.f22,
                      fontWeight: FontWeightManager.semiBold),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  "${userAccount.age}, ${userAccount.occupation}",
                  style: getBlack60TextStyle(),
                ),
                const SizedBox(
                  height: 240.0,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButtonWidget(
                      title: "Update My Profile",
                      onTap: () {
                        if (image == null) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please provide an image",
                                textAlign: TextAlign.center,
                                style: getWhiteTextStyle().copyWith(
                                  fontWeight: FontWeightManager.semiBold,
                                ),
                              ),
                            ),
                          );
                          return;
                        }
                        userAccount.imageProfile = image?.path;
                        context.read<AuthBloc>().add(
                              RegisterAuthEvent(
                                userAccount: userAccount,
                                isRegister: true,
                              ),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                CustomTextButtonWidget(
                    title: "Skip for now",
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            RegisterAuthEvent(
                              userAccount: userAccount,
                              isRegister: true,
                            ),
                          );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
