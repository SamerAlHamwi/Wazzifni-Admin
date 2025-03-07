

import '../../params/base_params.dart';

class GetListRequest extends BaseParams {
  int? SkipCount;
  int? MaxResultCount;

  GetListRequest({this.SkipCount, this.MaxResultCount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (SkipCount != null) data['SkipCount'] = SkipCount;
    if (MaxResultCount != null) data['MaxResultCount'] = MaxResultCount;

    return data;
  }
}
