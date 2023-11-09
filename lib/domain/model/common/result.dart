// 다양한 인스턴스 제공 하는것

import 'package:common/core/utils/error/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';
@freezed
class Result<T> with _$Result{
  const factory Result.Success(T data) = Success;
  const factory Result.failure(ErrorResponse error) = Error;
}