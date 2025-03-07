
import 'base_error.dart';

class UnknownError extends BaseError {
  const UnknownError({this.errorMessage}) : super(message: errorMessage);
  final String? errorMessage;
  @override
  List<Object?> get props => throw UnimplementedError();
}
