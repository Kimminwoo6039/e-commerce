import 'package:common/domain/model/display/display.model.dart';
import 'package:common/domain/repository/repository.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';

import '../../data/dto/common/response_wrapper/response_wrapper.dart';
import '../model/display/menu/menu.model.dart';


abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
});

  Future<ResponseWrapper<List<ViewModule>>> getViewModultByTabId({
    required int tabId,
  });
}