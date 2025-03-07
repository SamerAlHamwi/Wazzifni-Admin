import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/errors/base_error.dart';
import '../../results/result.dart';
part 'create_model_state.dart';

typedef UsecaseCallBack = Future<Result>? Function(dynamic data);

class CreateModelCubit<Model> extends Cubit<CreateModelState> {
  final UsecaseCallBack getData;

  CreateModelCubit(this.getData) : super(CreateModelInitial());

  Future<bool>createModel({dynamic requestData}) async {
    emit(Loading());
    try {
      Result? response = await getData(requestData);
      if (response != null) {
        if (response.hasDataOnly) {
          emit(CreateModelSuccessfully(model: response.data));
          return true;
        } else if (response.hasErrorOnly) {
          emit(Error(message: response.error!.message!, error: response.error));
          return false;
        } else {
          emit(Error(message: 'some thing went wrong'));
          return false;
        }
      } else {
        emit(CreateModelInitial());
        return false;
      }
    } catch (e) {
      emit(Error(message: e.toString()));
      return false;
    }
  }
}
