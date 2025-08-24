import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oict/features/stop_departure_board/presentation/bloc/stop_departure_board_bloc.dart';
import 'package:oict/features/stop_departure_board/presentation/widgets/departure_board_tile.dart';
import 'package:oict/router/route_constants.dart';
import 'package:oict/router/routes.dart';

class StopDepartureBoardScreen extends StatelessWidget {
  const StopDepartureBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RouteConstants.STOP_DEPARTURE_BOARD_TITLE),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<StopDepartureBoardBloc, StopDepartureBoardState>(
        builder: (context, state) {
          switch (state) {
            case StopDepartureBoardStateInitial _ || StopDepartureBoardStateLoading _:
              return const Center(child: CircularProgressIndicator());
            case StopDepartureBoardStateSuccess _:
              final group = state.data.departures.first.group;
              return ListView.separated(
                itemCount: group.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final item = group[index];
                  return DepartureBoardTile(item: item);
                },
              );
            case StopDepartureBoardStateError error:
              return Center(child: Text(error.message));
          }
        },
      ),
    );
  }
}
