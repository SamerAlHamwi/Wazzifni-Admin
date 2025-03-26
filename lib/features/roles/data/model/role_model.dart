

import '../../../../core/boilerplate/api/data_source/model.dart';
import '../../../../core/boilerplate/responses/ApiResponse.dart';

class RoleListResponse extends ApiResponse<RoleListModel> {
  RoleListResponse({super.errors, required bool super.success, required super.data});
  factory RoleListResponse.fromJson(Map<String, dynamic> json) {
    return RoleListResponse(
        errors: json['error'],
        data: RoleListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}


class RoleListModel extends BaseModel {
  int? totalCount;
  List<RoleModel>? items;

  RoleListModel({
    this.totalCount,
    this.items,
  });

  RoleListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => RoleModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}



class RoleModel extends BaseModel {
  int? id;
  String? name;
  String? displayName;
  String? normalizedName;
  String? description;
  List<String>? grantedPermissions;

  RoleModel({
    this.id,
    this.name,
    this.displayName,
    this.normalizedName,
    this.description,
    this.grantedPermissions,
  });

  RoleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    displayName = json['displayName'] as String?;
    normalizedName = json['normalizedName'] as String?;
    description = json['description'] as String?;
    grantedPermissions = (json['grantedPermissions'] as List?)?.map((dynamic e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['displayName'] = displayName;
    json['normalizedName'] = normalizedName;
    json['description'] = description;
    json['grantedPermissions'] = grantedPermissions;
    return json;
  }
}