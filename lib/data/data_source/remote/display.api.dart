import 'package:common/data/dto/display/display.dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../dto/common/response_wrapper/response_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'display.api.g.dart';

@RestApi()
abstract class DisPlayApi {
  factory DisPlayApi(Dio dio, {String baseUrl}) = _DisPlayApi;

  @GET("/api/menus/{mall_type}")
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
      @Path('mall_type') String mallType);

  @GET("/api/view-modules/{tab_id}")
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
      @Path('tab_id') int mallType, @Query('page') int page);
}
