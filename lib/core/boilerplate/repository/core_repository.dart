
import 'package:dartz/dartz.dart';
import '../api/data_source/model.dart';
import '../api/errors/base_error.dart';
import '../results/result.dart';

abstract class CoreRepository {
  Result<Model> call<Model extends BaseModel>({required Either<BaseError, BaseModel> result}) {
    if (result.isRight()) {
      return RemoteResult(
        data: (result as Right).value,
      );
    } else {
      return RemoteResult(
        error: (result as Left).value,
      );
    }
  }

  Result<List<Model>> paginatedCall<Model extends BaseModel>({required Either<BaseError, BaseModel> result}) {
    if (result.isRight()) {
      return PaginatedResult(
        data: (result as Right).value.items,

        ///TODO if responce is list direct remove data and return value
      );
    } else {
      return RemoteResult(
        error: (result as Left).value,
      );
    }
  }

  Result<dynamic> noModelCall({required Either<BaseError, dynamic> result}) {
    if (result.isRight()) {
      return Result(data: (result as Right).value);
    } else {
      return RemoteResult(
        error: (result as Left).value,
      );
    }
  }
}
