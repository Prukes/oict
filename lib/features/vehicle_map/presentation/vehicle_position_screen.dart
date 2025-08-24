import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:oict/features/vehicle_map/presentation/bloc/vehicle_position_bloc.dart';
import 'package:oict/router/route_constants.dart';

class VehiclePositionScreen extends StatelessWidget {
  const VehiclePositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RouteConstants.VEHICLE_MAP_TITLE),
      ),
      body: BlocBuilder<VehiclePositionBloc, VehiclePositionState>(
        builder: (context, state) {
          return Stack(
            children: [
              FlutterMap(
                mapController: context.read<VehiclePositionBloc>().controller,
                options: MapOptions(
                  initialCenter: LatLng(50.073658, 14.418540),
                  initialZoom: 10.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'cz.prukes.oict.map',
                  ),
                  MarkerLayer(
                    alignment: Alignment.center,
                    markers: [
                      if (state.data != null && state.data?.vehiclePosition.geometry != null)
                        Marker(
                          point: LatLng(
                            state.data!.vehiclePosition.geometry!.coordinates.last,
                            state.data!.vehiclePosition.geometry!.coordinates.first,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              state.mapOrNull<Widget>(
                    loading: (_) => Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Text('Loading...'),
                      ),
                    ),
                  ) ??
                  const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
