part of 'advice_bloc.dart';

@immutable
sealed class AdviceEvent {}

class AdviceRequestEvent extends AdviceEvent {}
