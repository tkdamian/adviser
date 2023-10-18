import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/usecases/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final usecase = AdviceUsecase();
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdviceStateLoading());
      AdviceEntity advice = await usecase.getAdviceUsecase();
      emit(AdviceStateLoaded(advice: advice.text));
    });
  }
}
