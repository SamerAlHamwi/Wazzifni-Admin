


import '../../responses/ApiResponse.dart';
import '../data_source/model.dart';


class EmptyModel extends ApiResponse<EmptyModelItem>  {
  EmptyModel({super.errors, required bool super.success, required super.data});
  factory EmptyModel.fromJson(Map<String, dynamic> json) {
    return EmptyModel(
        errors: json['error'],
        data: EmptyModelItem.fromJson(json['result']),
        success: json['success'],
    );
  }
}

class EmptyModelItem extends BaseModel {

  bool? isOk;
  EmptyModelItem.fromJson(json){
    isOk = json['isOk'] ?? true;
  }
}

