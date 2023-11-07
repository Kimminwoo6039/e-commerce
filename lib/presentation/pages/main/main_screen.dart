import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/constant/app_icons.dart';
import '../category/category_page.dart';
import '../home/home_page.dart';
import '../search/search_page.dart';
import '../user/user_page.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_nav_cubit.dart';
import 'cubit/mall_type_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => MallTypeCubit()),
      ],
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          switch (state) {
            case BottomNav.home:
              return const HomePage();
            case BottomNav.category:
              return const CategoryPage();
            case BottomNav.search:
              return const SearchPage();
            case BottomNav.user:
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavCubit, BottomNav>(builder: (_, state) {
        return BottomNavigationBar(
          items: List.generate(
            BottomNav.values.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNav.values[index].icon),
              activeIcon: SvgPicture.asset(
                BottomNav.values[index].activeIcon,
              ),
              label: BottomNav.values[index].toName,
            ),
          ),
          currentIndex: state.index,
          onTap: (index) => context.read<BottomNavCubit>().changerIndex(index),
          showSelectedLabels: false,

          /// 라벨 글씨로 인한 아이콘 띄우는것 삭제
          showUnselectedLabels: false,

          /// 라벨 글씨로 인한 아이콘 띄우는것 삭제
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
