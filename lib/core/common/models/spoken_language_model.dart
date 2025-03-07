



import '../../boilerplate/api/data_source/model.dart';

class SpokenLanguages extends BaseModel {
  SpokenLanguage? spokenLanguage;
  int? oralLevel;
  int? writingLevel;
  bool? isNative;

  SpokenLanguages({
    this.spokenLanguage,
    this.oralLevel,
    this.writingLevel,
    this.isNative,
  });

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    spokenLanguage = (json['spokenLanguage'] as Map<String,dynamic>?) != null ? SpokenLanguage.fromJson(json['spokenLanguage'] as Map<String,dynamic>) : null;
    oralLevel = json['oralLevel'] as int?;
    writingLevel = json['writingLevel'] as int?;
    isNative = json['isNative'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['spokenLanguage'] = spokenLanguage?.toJson();
    json['oralLevel'] = oralLevel;
    json['writingLevel'] = writingLevel;
    json['isNative'] = isNative;
    return json;
  }
}

class SpokenLanguage extends BaseModel {
  int? id;
  String? name;
  String? displayName;

  SpokenLanguage({
    this.id,
    this.name,
    this.displayName,
  });

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    displayName = json['displayName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['displayName'] = displayName;
    return json;
  }
}
