



import '../../boilerplate/api/data_source/model.dart';
import '../../boilerplate/responses/ApiResponse.dart';


class AttachmentsResponse extends ApiResponse<Attachments> {
  AttachmentsResponse({super.errors, required bool super.success, required super.data});
  factory AttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return AttachmentsResponse(
        errors: json['error'], data: Attachments.fromJson(json['result']), success: json['success']);
  }
}

class Attachments extends BaseModel {
  int? id;
  String? url;
  String? lowResolutionPhotoUrl;
  String? size;
  int? refId;
  String? name;

  Attachments({
    this.id,
    this.url,
    this.lowResolutionPhotoUrl,
    this.size,
    this.refId,
    this.name,
  });

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    url = json['url'] as String?;
    lowResolutionPhotoUrl = json['lowResolutionPhotoUrl'] as String?;
    size = json['size'] as String?;
    refId = json['refId'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    json['lowResolutionPhotoUrl'] = lowResolutionPhotoUrl;
    json['size'] = size;
    json['refId'] = refId;
    json['name'] = name;
    return json;
  }
}