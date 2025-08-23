import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oict/features/stop_departure_board/presentation/bloc/stop_departure_board_bloc.dart';
import 'package:oict/features/stop_departure_board/presentation/stop_departure_board_screen.dart';
import 'package:oict/features/stops_overview/presentation/cubit/stops_overview_cubit.dart';
import 'package:oict/features/stops_overview/presentation/stops_overview_screen.dart';
import 'package:oict/router/route_constants.dart';

part 'routes.g.dart';

@TypedGoRoute<StopsOverviewRouteData>(
  path: RouteConstants.STOPS_OVERVIEW_PATH,
  name: RouteConstants.STOPS_OVERVIEW_NAME,
  routes: <TypedGoRoute>[
    TypedGoRoute<StopDepartureBoardRouteData>(
      path: RouteConstants.STOP_DEPARTURE_BOARD_PATH,
      name: RouteConstants.STOP_DEPARTURE_BOARD_NAME,
      routes: <TypedGoRoute>[
        TypedGoRoute<VehicleMapRouteData>(
          path: RouteConstants.VEHICLE_MAP_PATH,
          name: RouteConstants.VEHICLE_MAP_NAME,
        ),
      ],
    ),
  ],
)
class StopsOverviewRouteData extends GoRouteData with _$StopsOverviewRouteData {
  const StopsOverviewRouteData();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => StopsOverviewCubit()..loadStops(),
      child: StopsOverviewScreen(),
    );
  }
}

class StopDepartureBoardRouteData extends GoRouteData with _$StopDepartureBoardRouteData {
  final String stopId;
  const StopDepartureBoardRouteData({required this.stopId});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      key: ValueKey(stopId),
      create: (context) => StopDepartureBoardBloc(stopId: stopId)..add(StopDepartureBoardEvent.started()),
      child: StopDepartureBoardScreen(),
    );
  }
}

class VehicleMapRouteData extends GoRouteData with _$VehicleMapRouteData {
  final String stopId;
  final String vehicleId;
  const VehicleMapRouteData({required this.stopId, required this.vehicleId});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Text('');
  }
}
