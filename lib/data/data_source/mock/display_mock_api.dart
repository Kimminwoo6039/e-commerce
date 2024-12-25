import 'dart:convert';
import 'dart:io';

import 'package:common/data/dto/display/view_module/view_module.dto.dart';

import '../../dto/common/response_wrapper/response_wrapper.dart';
import '../../dto/display/menu/menu.dto.dart';
import '../remote/display.api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisPlayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _menuParser(mallType == 'market'
            ? DisplayMockData.menusByMarket
            : DisplayMockData.menusByBeauty),
      ),
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
      int tabId, int page) {
    if (page == 4) {
      return Future(() => ResponseWrapper(
            status: 'SUCCESS',
            code: '0000',
            message: '',
            data: [],
          ));
    }

    late String source;
    final endofTabId = tabId % 10;
    switch (endofTabId) {
      case 1:
        source = DisplayMockData.viewModulesByTabIdCaseOne;
      case 2:
        source = DisplayMockData.viewModulesByTabIdCaseTwo;
      case 3:
        source = DisplayMockData.viewModulesByTabIdCaseThree;
      case 4:
        source = DisplayMockData.viewModulesByTabIdCaseFour;
      case 5:
        source = DisplayMockData.viewModulesByTabIdCaseFive;
    }

    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: viewModuleParser(source),
      ),
    );
  }

  /// 메뉴
  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }

  /// 뷰 모듈
  List<ViewModuleDto> viewModuleParser(String source) {
    List<ViewModuleDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => ViewModuleDto.fromJson(e)).toList();

    return menus;
  }
}
