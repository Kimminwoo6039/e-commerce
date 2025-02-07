import 'package:common/core/utils/extensions.dart';
import 'package:common/presentation/pages/home/component/view_module_list/factory/view_module_widget.dart';
import 'package:common/presentation/pages/home/component/view_module_list/view_module_B.dart';
import 'package:common/presentation/pages/home/component/view_module_list/view_module_NONE.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../domain/model/display/view_module/view_module.model.dart';
import '../view_module_A.dart';
import '../view_module_C.dart';
import '../view_module_D.dart';
import '../view_module_E.dart';

enum Modules { viewModuleA, viewModuleB, viewModuleC, viewModuleD, viewModuleE }

class ViewModuleFactory {
  Widget textToWidget(ViewModule viewModule) {
    final String type = viewModule.type.toSnakeCase();
    for (final module in Modules.values) {
      final String name = module.name.toSnakeCase();
      if (name.contains(type)) {
        return module.toWidget() as Widget;
      }
    }

    return const ViewModuleNone();
  }
}

// 이렇게 작성하는 이유
// 컴파일 에서 찾을수 있어서 장점
// ViewModuleWidget 클래스가 Widget을 상속받았는지 확인
extension ModuleX on Modules {
  ViewModuleWidget toWidget() {
    switch (this) {
      case Modules.viewModuleA:
        return const ViewModuleA();
      case Modules.viewModuleB:
        return const ViewModuleB();
      case Modules.viewModuleC:
        return const ViewModuleC();
      case Modules.viewModuleD:
        return const ViewModuleD();
      case Modules.viewModuleE:
        return const ViewModuleE();
    }
  }
}
