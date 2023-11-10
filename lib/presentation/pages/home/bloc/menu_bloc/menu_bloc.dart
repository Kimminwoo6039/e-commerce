import 'package:common/core/utils/constant.dart';
import 'package:common/core/utils/error/error_response.dart';
import 'package:common/core/utils/exception/common_exception.dart';
import 'package:common/core/utils/logger.dart';
import 'package:common/domain/usecase/display/menu/get_menus.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../main/cubit/mall_type_cubit.dart';

part 'menu_event.dart';

part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc(this._displayUsecase) : super(MenuState()) {
    on<MenuIntiialized>(_onMenuIntitialized);
  }

  Future<void> _onMenuIntitialized(
      MenuIntiialized event, Emitter<MenuState> emit) async {
    final mallType = event.mallType;

    emit(state.copyWith(status: Status.loading)); // 로딩으로 변경

    await Future.delayed(Duration(seconds: 2));

    try {

      final response = await _fetch(mallType);

      response.when(Success: (menus) {
        emit(
          state.copyWith(
            status: Status.success,
            menus: menus,
            mallType: mallType,
          ),
        );
      }, failure: (error) {
        emit(
          state.copyWith(
            status: Status.error,
            error: error,
          ),
        );
      });
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(
            error,
          ),
        ),
      );
    }
  }

  Future<Result<List<Menu>>> _fetch(MallType mallType) async {
    return await _displayUsecase.excute(
      usecase: GetMenusUsecase(malltype: mallType),
    );
  }
}
