import 'package:common/domain/usecase/display/display.usecase.dart';
import 'package:common/presentation/pages/home/bloc/view_modult-bloc/view_module_bloc.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:common/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../view_module_list/view_module_list.dart';

class GlobalNavBarView extends StatelessWidget {
  const GlobalNavBarView(this.menus, this.mallType, {super.key});

  final List<Menu> menus;
  final MallType mallType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      children: List.generate(
        menus.length,
        (index) {
          return BlocProvider(
            create: (_) => ViewModuleBloc(locator<DisplayUsecase>())
              ..add(ViewModultInitalized(menus[index].tabId)),
            child: const ViewModuleList(),
          );
        },
      ),
    ));
  }
}
