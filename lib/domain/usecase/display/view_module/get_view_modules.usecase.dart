import '../../../../core/utils/error/error_response.dart';
import '../../../model/common/result.dart';
import '../../../repository/display.repository.dart';
import '../../base/remote.usecase.dart';

class GetViewModulesUsecase extends RemoteUsecase<DisplayRepository> {
  final int tabId;
  final int page;

  GetViewModulesUsecase({required this.tabId, required this.page});

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.getViewModultByTabId(
        tabId: tabId, page: page);

    return (result.status == 'SUCCESS')
        ? Result.Success(result.data ?? [])
        : Result.failure(
        ErrorResponse(
            status: result.status,
            code: result.code,
            message: result.message
        )
    );
  }
}