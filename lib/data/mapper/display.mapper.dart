import 'package:common/data/dto/display/menu/menu.dto.dart';

import '../../domain/model/display/menu/menu.model.dart';

extension MenuX on MenuDto {
  /// TODO : 메뉴 DTO를 메뉴로 변환
  Menu toModel() {
      return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}