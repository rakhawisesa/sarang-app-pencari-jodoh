import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang/src/common_widgets/people_love_card_widget.dart';
import 'package:sarang/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class PeopleLovedScreen extends StatefulWidget {
  const PeopleLovedScreen({super.key});

  static const String routeName = "/people-loved";

  @override
  State<PeopleLovedScreen> createState() => _PeopleLovedScreenState();
}

class _PeopleLovedScreenState extends State<PeopleLovedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PeopleLovedBloc>().add(OnPeopleLovedEventCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "People You\nLoved",
          textAlign: TextAlign.center,
          style: getWhiteTextStyle().copyWith(
            fontSize: FontSizeManager.f20,
            fontWeight: FontWeightManager.semiBold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: AppSize.s30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s40,
          ),
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {
              if (state is PeopleLovedLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PeopleLovedLoaded) {
                final users = state.userMatch;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return PeopleLoveCardWidget(
                        user: users[index],
                      );
                    },
                    itemCount: users.length,
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
