import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Text('');
        },
      ),
    );
  }
}
