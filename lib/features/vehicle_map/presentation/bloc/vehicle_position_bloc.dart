import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oict/features/vehicle_map/data/vehicle_map_service.dart';
import 'package:oict/features/vehicle_map/domain/vehicle_position_dto.dart';
import 'package:oict/network/dio_instance.dart';

part 'vehicle_position_event.dart';
part 'vehicle_position_state.dart';
part 'vehicle_position_bloc.freezed.dart';

class VehiclePositionBloc extends Bloc<VehiclePositionEvent, VehiclePositionState> {
  final String vehicleId;
  late final Timer _timer;
  final VehicleMapService _service;
  VehiclePositionBloc({required this.vehicleId})
    : _service = VehicleMapService(DioInstance.instance),
      super(_Initial()) {
    on<_Started>((event, emit) {
      _timer = Timer.periodic(const Duration(seconds: 5), (t) {
        add(const VehiclePositionEvent.fetch());
      });
    });
    on<_Fetch>((event, emit) async {
      emit(const VehiclePositionState.loading());
      try {
        final newPosition = await _service.getVehiclePosition(vehicleId);
        emit(
          VehiclePositionState.success(
            vehiclePosition: newPosition,
          ),
        );
      } catch (e) {
        emit(VehiclePositionState.error('Failed to fetch vehicle position'));
      }
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
