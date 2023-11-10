import 'package:common/domain/repository/repository.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';

import '../../data/dto/common/response_wrapper/response_wrapper.dart';
import '../../data/dto/display/menu/menu.dto.dart';
import '../model/display/menu/menu.model.dart';


abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
});
}