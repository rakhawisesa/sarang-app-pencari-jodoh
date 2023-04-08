import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang/src/common_widgets/explore_people_app_bar_widget.dart';
import 'package:sarang/src/common_widgets/explore_people_button_widget.dart';
import 'package:sarang/src/common_widgets/match_card_widget.dart';
import 'package:sarang/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang/src/features/authentication/domain/user_account.dart';
import 'package:sarang/src/features/likes_you/presentation/bloc/explore_people/explore_people_bloc.dart';
import 'package:sarang/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  static const String routeName = "/explore-people";

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? account;
  final cardController = AppinioSwiperController();

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    account = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    getDataUserAccount();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p40, horizontal: AppPadding.p24),
        child: SafeArea(
          child: Column(
            children: [
              ExplorePeopleAppBarWidget(
                imagePath: account?.imageProfile,
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
                builder: (context, state) {
                  if (state is ExplorePeopleLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state is ExplorePeopleLoaded) {
                    final users = state.result;
                    List<Widget> cards = [];
                    for (var user in users) {
                      cards.add(MatchCardWidget(user: user));
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: AppinioSwiper(
                              direction: AppinioSwiperDirection.top,
                              controller: cardController,
                              onSwipe: (int index,
                                  AppinioSwiperDirection direction) {
                                if (direction == AppinioSwiperDirection.top) {
                                  if (index < users.length) {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Yey! You matched with ${users[index - 1].fullName}",
                                          textAlign: TextAlign.center,
                                          style: getWhiteTextStyle().copyWith(
                                            fontWeight:
                                                FontWeightManager.semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    context
                                        .read<ExplorePeopleBloc>()
                                        .add(OnExplorePeopleEventCalled());
                                    index = 0;
                                  }
                                }
                                if (direction != AppinioSwiperDirection.left &&
                                    direction != AppinioSwiperDirection.right &&
                                    direction !=
                                        AppinioSwiperDirection.bottom) {
                                  context.read<PeopleLovedBloc>().add(
                                        AddPeopleLoved(user: users[index]),
                                      );
                                }
                              },
                              onEnd: () {
                                context
                                    .read<ExplorePeopleBloc>()
                                    .add(OnExplorePeopleEventCalled());
                              },
                              padding: const EdgeInsets.all(0),
                              cardsCount: users.length,
                              cardsBuilder: (BuildContext context, int index) {
                                return cards[index];
                              },
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s40,
                          ),
                          ExplorePeopleButtonWidget(
                            controller: cardController,
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
