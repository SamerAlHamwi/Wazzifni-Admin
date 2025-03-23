

import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../../core/common/models/cities_response.dart';
import '../../../login/data/repository/auth_repository.dart';


class CitiesParams extends BaseParams {

  CitiesParams({
    this.countryId,
  });


  final int? countryId;

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("isActive", () => true);

    if (countryId != null) {
      queryParams.putIfAbsent("CountryId", () => countryId);
    }

    return queryParams;
  }
}

class GetCitiesUseCase extends UseCase<CityListModel, CitiesParams> {
  final AuthRepository repository;

  GetCitiesUseCase(this.repository);

  @override
  Future<Result<CityListModel>> call({required CitiesParams params}) {
    return repository.getCities(params: params);
  }
}
