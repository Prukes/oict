part of 'stop_departure_board_bloc.dart';

@freezed
sealed class StopDepartureBoardState with _$StopDepartureBoardState {
  const factory StopDepartureBoardState.initial({required StopDepartureBoardStateData data}) =
      StopDepartureBoardStateInitial;
  const factory StopDepartureBoardState.loading({required StopDepartureBoardStateData data}) =
      StopDepartureBoardStateLoading;
  const factory StopDepartureBoardState.success({required StopDepartureBoardStateData data}) =
      StopDepartureBoardStateSuccess;
  const factory StopDepartureBoardState.error({required String message, required StopDepartureBoardStateData data}) =
      StopDepartureBoardStateError;
}

@freezed
sealed class StopDepartureBoardStateData with _$StopDepartureBoardStateData {
  const factory StopDepartureBoardStateData({required List<PublicDepartureGroupDto> departures}) =
      _StopDepartureBoardStateData;
}
