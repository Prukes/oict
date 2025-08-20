part of 'vehicle_position_bloc.dart';

@freezed
sealed class VehiclePositionEvent with _$VehiclePositionEvent {
  const factory VehiclePositionEvent.started() = _Started;
  const factory VehiclePositionEvent.fetch() = _Fetch;
}
