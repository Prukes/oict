part of 'stop_departure_board_bloc.dart';

@freezed
sealed class StopDepartureBoardEvent with _$StopDepartureBoardEvent {
  const factory StopDepartureBoardEvent.started() = StopDepartureBoardEventStarted;
}
