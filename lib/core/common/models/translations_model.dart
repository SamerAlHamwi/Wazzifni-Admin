



import '../../boilerplate/api/data_source/model.dart';

class Translations extends BaseModel {
  String? name;
  String? about;
  String? address;
  String? language;

  Translations({
    this.name,
    this.language,
    this.about,
    this.address,
  });

  Translations.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    language = json['language'] as String?;
    about = json['about'] as String?;
    address = json['address'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['language'] = language;
    json['about'] = about;
    json['address'] = address;
    return json;
  }
}