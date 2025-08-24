part of 'vehicle_position_bloc.dart';

@freezed
sealed class VehiclePositionState with _$VehiclePositionState {
  const factory VehiclePositionState.initial({VehiclePositionStateData? data}) = _Initial;
  const factory VehiclePositionState.loading({VehiclePositionStateData? data}) = _Loading;
  const factory VehiclePositionState.success({VehiclePositionStateData? data}) = _Success;
  const factory VehiclePositionState.error({
    required String message,
    VehiclePositionStateData? data,
  }) = _Error;
}

@freezed
abstract class VehiclePositionStateData with _$VehiclePositionStateData {
  const factory VehiclePositionStateData({
    required PublicVehiclePositionDto vehiclePosition,
  }) = _VehiclePositionStateData;
}
