import 'package:common/core/utils/error/error_response.dart';
import 'package:common/core/utils/exception/common_exception.dart';
import 'package:common/core/utils/logger.dart';
import 'package:common/domain/model/display/display.model.dart';
import 'package:common/domain/usecase/display/display.usecase.dart';
import 'package:common/domain/usecase/display/view_module/get_view_modules.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../domain/model/common/result.dart';

part 'view_module_event.dart';

part 'view_module_state.dart';

part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()){
    on<ViewModultInitalized>(_onViewModuleInitalized);
  }

  Future<void> _onViewModuleInitalized(
      ViewModultInitalized event, Emitter<ViewModuleState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final tabId = event.tabId;
    try {

      final response = await _fetch(tabId);
      response.when(

          Success: (viewModules) {
            emit(state.copyWith(status: Status.success , tabId: tabId,viewModules: viewModules));
          },

          failure: (error) {
            emit(state.copyWith( status: Status.error, error:error));
          });

    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(error)));
    }
  }

  Future<Result<List<ViewModule>>> _fetch(int tabId) async {
    return await _displayUsecase.excute(
        usecase: GetViewModulesUsecase(tabId: tabId));
  }
}
