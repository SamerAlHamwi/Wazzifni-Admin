import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  int? id;
  BaseModel({this.id});
  @override
  List<Object?> get props => [id];
}
