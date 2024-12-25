import 'package:common/core/theme/custom/custom_font_weight.dart';
import 'package:common/core/theme/custom/custom_theme.dart';
import 'package:common/core/utils/constant.dart';
import 'package:common/presentation/pages/home/bloc/menu_bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/model/display/menu/menu.model.dart';

class GlobalNavBar extends StatelessWidget {
  const GlobalNavBar(this.menus, {super.key});

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
      return Stack(
        children: [
          TabBar(
            isScrollable: true,  // 스크롤 가능하게 설정
            tabAlignment: TabAlignment.start,  // 왼쪽 정렬
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            tabs: List.generate(
              menus.length,
              (index) => Tab(
                text: menus[index].title,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: textTheme.titleSmall.semiBold,
            unselectedLabelStyle: textTheme.titleSmall,
            unselectedLabelColor: colorScheme.contentSecondary,
          ),
          if (state.status == Status.loading)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Transform.scale(child: CircularProgressIndicator(),scale: 0.5,),
                ),
              ),
            )
        ],
      );
    });
  }
}
