import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/constant/app_icons.dart';

enum BottomNav {home, category , search , user}

class BottomNavCubit extends Cubit<BottomNav> {
  BottomNavCubit() : super(BottomNav.home);

  /// Bottom 클릭시 index 값 변경 로직
  void changerIndex(int index)=> emit(BottomNav.values[index]);
}
  /// Bottom 리팩토링 반복 코드
extension BottomNavX on BottomNav {
  
  /// TODO : 누르기전 아이콘
  String get icon {
    switch(this) {
      case BottomNav.home:
        return AppIcons.navHome;
      case BottomNav.category:
        return AppIcons.navCategory;
      case BottomNav.search:
        return AppIcons.navSearch;
      case BottomNav.user:
        return AppIcons.navUser;
    }
  }

  /// TODO : 누른후 아이콘
  String get activeIcon {
    switch(this) {
      case BottomNav.home:
        return AppIcons.navHomeOn;
      case BottomNav.category:
        return AppIcons.navCategoryOn;
      case BottomNav.search:
        return AppIcons.navSearchOn;
      case BottomNav.user:
        return AppIcons.navUserOn;
    }
  }

  /// TODO : 누른후 라벨값
  String get toName {
    switch(this) {
      case BottomNav.home:
        return "홈";
      case BottomNav.category:
        return "카테고리";
      case BottomNav.search:
        return "마이페이지";
      case BottomNav.user:
        return "사용자";
    }
  }
  
  
}