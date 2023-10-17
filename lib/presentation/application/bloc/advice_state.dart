part of 'advice_bloc.dart';

@immutable
sealed class AdviceState {}

final class AdviceInitial extends AdviceState {}

final class AdviceStateLoading extends AdviceState {}

final class AdviceStateLoaded extends AdviceState {
  final String advice;
  AdviceStateLoaded({required this.advice});
}

final class AdviceStateError extends AdviceState {
  final String message;
  AdviceStateError({required this.message});
}
