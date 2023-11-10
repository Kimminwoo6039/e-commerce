import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/model/display/menu/menu.model.dart';

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
          (index) => Column(
            children: [
              Text('mallType : ${mallType}'),
              Text('mallType : ${menus[index].title}'),
            ],
          ),
        ),
      ),
    );
  }
}
