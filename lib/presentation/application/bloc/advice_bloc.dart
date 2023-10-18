import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:adviser/domain/usecases/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final AdviceUsecase usecase;
  AdviceBloc({required this.usecase}) : super(AdviceInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdviceStateLoading());
      Either<AdviceFailure, AdviceEntity> adviceOrFailure =
          await usecase.getAdviceUsecase();

      adviceOrFailure.fold(
          (failure) => emit(
              AdviceStateError(message: _mapAdviceFailureToMessage(failure))),
          (advice) => emit(AdviceStateLoaded(advice: advice.text)));
    });
  }

  String _mapAdviceFailureToMessage(AdviceFailure failure) {
    switch (failure.runtimeType) {
      case ServerAdviceFailure:
        return "ups, API Error. Please try again!";
      case GeneralAdviceFailure:
        return "ups, something gone wrong. Please try again!";
      default:
        return "ups, something gone wrong. Please try again!";
    }
  }
}
