import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_icons.dart';
import '../../../../../core/theme/custom/custom_app_bar.dart';
import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return AnimatedContainer (
          duration: const Duration(microseconds: 400),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          color: state.theme.backgroundColor,
          child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: SvgIconButton(icon: AppIcons.mainLogo,padding: 8,color: state.theme.logoColor,),
              leadingWidth: 86,
              title: AnimatedContainer(
                duration: Duration(microseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(CustomAppBarTheme.tabBarRadius)),
                  // color: state.theme.indicatorColor,
                ),
                child: SizedBox(
                  height: 28,
                  child: DefaultTabController(
                    initialIndex: state.index,
                    length: MallType.values.length,
                    child: TabBar(
                      splashBorderRadius: BorderRadius.all(Radius.circular(CustomAppBarTheme.tabBarRadius)),
                      onTap: (index) =>
                          context.read<MallTypeCubit>().changeIndex(index),
                      labelColor: state.theme.labelColor,
                      unselectedLabelColor: state.theme.unselectedLabelColor,
                      labelPadding: EdgeInsets.symmetric(horizontal: 11),
                      labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List.generate(
                          MallType.values.length,
                          (index) => Tab(
                                text: MallType.values[index].toName,
                              )),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: state.theme.indicatorColor,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                SvgIconButton(icon: AppIcons.location, color: state.theme.iconColor),
                SvgIconButton(icon: AppIcons.cart, color: state.theme.iconColor),
              ]));
    });
  }
}
