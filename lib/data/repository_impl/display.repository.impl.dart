import 'package:common/data/data_source/remote/display.api.dart';
import 'package:common/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:common/data/mapper/common.mapper.dart';
import 'package:common/data/mapper/display.mapper.dart';
import 'package:common/domain/model/display/menu/menu.model.dart';
import 'package:common/domain/repository/display.repository.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisPlayApi _disPlayApi;

  DisplayRepositoryImpl(this._disPlayApi);

  @override
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType (
      {required MallType mallType}) async {
    final reponse = await _disPlayApi.getMenusByMallType(mallType.name);

    return reponse.toModel<List<Menu>>(
      reponse.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}
