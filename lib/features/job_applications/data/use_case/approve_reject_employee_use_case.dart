


import '../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../repository/job_application_repository.dart';


class ApproveRejectApplicationParams extends BaseParams {

  final bool isApprove;
  final int id;
  final String? rejectReason;

  ApproveRejectApplicationParams({required this.id,this.rejectReason,required this.isApprove});

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("id", ()=> id);
    if(rejectReason != null) queryParams.putIfAbsent("rejectReason", ()=> rejectReason);

    return queryParams;
  }
}


class ApproveRejectApplicationUseCase extends UseCase<dynamic, ApproveRejectApplicationParams> {
  final JobApplicationRepository repository;

  ApproveRejectApplicationUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required ApproveRejectApplicationParams params}) {
    return repository.approveRejectApplication(params: params);
  }
}

