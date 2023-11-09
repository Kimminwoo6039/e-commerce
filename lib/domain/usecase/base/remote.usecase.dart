import 'package:common/domain/repository/repository.dart';

abstract class RemoteUsecase<T extends Repository> {
  // Repository 값만 상속받는다.
  Future call(T repository);

}