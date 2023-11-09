import 'package:common/data/repository_impl/display.repository.impl.dart';
import 'package:common/domain/usecase/base/remote.usecase.dart';

import '../../repository/display.repository.dart';

class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future excute<T> ({required RemoteUsecase usecase}) async {
    return await usecase(_displayRepository);
  }
}