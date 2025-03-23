


import 'package:wazzifni_admin/features/companies/data/use_case/reject_company_use_case.dart';

import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/common/models/company_model.dart';
import '../../../../core/common/models/job_model.dart';
import '../../../../core/common/models/profile_model.dart';
import '../../../jobs/data/use_case/get_job_use_case.dart';
import '../use_case/approve_company_use_case.dart';
import '../use_case/get_companies_use_case.dart';


class CompanyRepository extends CoreRepository {

  ///Company Details
  Future<Result<Company>> getCompanyDetails({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getCompanyAccount,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => CompanyDetailsResponse.fromJson(json),
      responseStr: 'CompanyDetailsResponse',
    );
    return call(result: result);
  }

  ///All Companies
  Future<Result<List<Company>>> getAllCompanies({required GetCompaniesParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getAllCompany,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => CompanyListResponse.fromJson(json),
      responseStr: 'CompanyListResponse',
    );
    return paginatedCall(result: result);
  }

  ///Job Details
  Future<Result<JobModel>> getJobDetails({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getWorkPost,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobsDetailsResponse.fromJson(json),
      responseStr: 'JobsDetailsResponse',
    );
    return call(result: result);
  }

  ///Application job details
  Future<Result<UserProfileModel>> getUserProfile({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getUserProfile,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => UserProfileResponse.fromJson(json),
      responseStr: 'UserProfileResponse',
    );
    return call(result: result);
  }

  ///Approve Company
  Future<Result<dynamic>> approveCompany({required ApproveCompanyParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      url: ApiURLs.approveCompany,
      method: HttpMethod.POST,
      withAuthentication: true,
      data: params.toJson(),
    );
    return noModelCall(result: result);
  }

  ///Reject Company
  Future<Result<dynamic>> rejectCompany({required RejectCompanyParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      url: ApiURLs.rejectCompany,
      method: HttpMethod.POST,
      withAuthentication: true,
      data: params.toJson(),
    );
    return noModelCall(result: result);
  }


}