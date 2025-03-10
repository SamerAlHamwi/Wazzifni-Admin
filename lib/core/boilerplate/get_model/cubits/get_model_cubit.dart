

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../results/result.dart';
part 'get_model_state.dart';

typedef UsecaseCallBack = Future<Result> Function();


class GetModelCubit<Model> extends Cubit<GetModelState> {
  final UsecaseCallBack getData;
  GetModelCubit(this.getData) : super(GetModelInitial());

  getModel() async {
    emit(Loading());
    Result response;
    try {
      response = await getData();
      if (response.hasDataOnly) {
        emit(GetModelSuccessfully(model: response.data));
      } else if (response.hasErrorOnly) {
        emit(Error(message: response.error!.message!));
      } else {
        emit(Error(message: 'some thing went wrong'));
      }
    } catch (e) {
      emit(Error(message: 'some thing went wrong'));
    }
  }
}
