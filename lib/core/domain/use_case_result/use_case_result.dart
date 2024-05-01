
import '../app_error/app_error.dart';

sealed class Result<T> {
  bool get isSuccess;

  factory Result({
    T? data,
    List<AppError>? errorList,
  }) {
    assert(((data == null) ^ (errorList == null)),
        'Data & error list can not be the same filled!');
    if (data != null) {
      return Result.good(data);
    }
    if (errorList != null) {
      return Result.bad(errorList);
    }
    throw Exception('Something went wrong with UseCaseResult arguments!');
  }

  const factory Result.good(T data) = GoodUseCaseResult;

  const factory Result.bad(List<AppError> errorList) = BadUseCaseResult;
}

class GoodUseCaseResult<T> implements Result<T> {
  final T data;

  const GoodUseCaseResult(this.data);

  @override
  bool get isSuccess => true;
}

class BadUseCaseResult<T> implements Result<T> {
  final List<AppError> errorList;

  const BadUseCaseResult(this.errorList);

  @override
  bool get isSuccess => false;
}
