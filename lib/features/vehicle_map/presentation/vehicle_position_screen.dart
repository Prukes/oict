import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oict/features/vehicle_map/presentation/bloc/vehicle_position_bloc.dart';

class VehiclePositionScreen extends StatelessWidget {
  const VehiclePositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclePositionBloc, VehiclePositionState>(
      builder: (context, state) {
        return Text('');
      },
    );
  }
}
