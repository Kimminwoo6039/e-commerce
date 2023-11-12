import 'package:common/data/dto/display/display.dto.dart';
import 'package:common/domain/model/display/display.model.dart';


extension MenuX on MenuDto {
  /// TODO : 메뉴 DTO를 메뉴로 변환
  Menu toModel() {
      return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}

extension ViewMouduleX on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(type: type ?? '', title: title ?? '', subtitle: subtitle ?? '', imageUrl: imageUrl ?? '');
  }
}