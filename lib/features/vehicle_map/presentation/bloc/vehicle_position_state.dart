part of 'vehicle_position_bloc.dart';

@freezed
sealed class VehiclePositionState with _$VehiclePositionState {
  const factory VehiclePositionState.initial() = _Initial;
  const factory VehiclePositionState.loading() = _Loading;
  const factory VehiclePositionState.success({required PublicVehiclePositionDto vehiclePosition}) = _Success;
  const factory VehiclePositionState.error(String message) = _Error;
}
