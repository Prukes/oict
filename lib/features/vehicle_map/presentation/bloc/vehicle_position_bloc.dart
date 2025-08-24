import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:oict/features/vehicle_map/data/vehicle_map_service.dart';
import 'package:oict/features/vehicle_map/domain/vehicle_position_dto.dart';
import 'package:oict/network/dio_instance.dart';

part 'vehicle_position_event.dart';
part 'vehicle_position_state.dart';
part 'vehicle_position_bloc.freezed.dart';

class VehiclePositionBloc extends Bloc<VehiclePositionEvent, VehiclePositionState> {
  final String vehicleId;
  final MapController controller = MapController();
  late final Timer _timer;
  final VehicleMapService _service;
  VehiclePositionBloc({required this.vehicleId})
    : _service = VehicleMapService(DioInstance.instance),
      super(_Initial()) {
    on<_Started>((event, emit) {
      add(const VehiclePositionEvent.fetch());
      _timer = Timer.periodic(const Duration(seconds: 5), (t) {
        add(const VehiclePositionEvent.fetch());
      });
    });
    on<_Fetch>((event, emit) async {
      if (state is _Loading) return;
      emit(VehiclePositionState.loading(data: state.data));
      try {
        final newPosition = await _service.getVehiclePosition(vehicleId);
        emit(
          VehiclePositionState.success(
            data: VehiclePositionStateData(vehiclePosition: newPosition),
          ),
        );
        if (newPosition.geometry == null || newPosition.geometry?.coordinates == null) return;
        controller.move(LatLng(newPosition.geometry!.coordinates.last, newPosition.geometry!.coordinates.first), 18.0);
      } catch (e) {
        emit(VehiclePositionState.error(message: 'Failed to fetch vehicle position', data: state.data));
      }
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    controller.dispose();
    return super.close();
  }
}
