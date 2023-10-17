import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    Future sleep1() {
      return Future.delayed(const Duration(seconds: 2), () => "1");
    }

    on<AdviceRequestEvent>((event, emit) async {
      emit(AdviceStateLoading());
      await sleep1();
      emit(AdviceStateLoaded(advice: 'This is a nice advice!'));
    });
  }
}
