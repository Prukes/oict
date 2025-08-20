import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oict/features/stop_departure_board/presentation/bloc/stop_departure_board_bloc.dart';

class StopDepartureBoardScreen extends StatelessWidget {
  const StopDepartureBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopDepartureBoardBloc, StopDepartureBoardState>(
      builder: (context, state) {
        switch (state) {
          case StopDepartureBoardStateInitial _ || StopDepartureBoardStateLoading _:
            return const Center(child: CircularProgressIndicator());
          case StopDepartureBoardStateSuccess _:
            return ListView.separated(
              itemCount: state.data.departures.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data.departures[index].toString()),
                );
              },
            );
          case StopDepartureBoardStateError error:
            return Center(child: Text(error.message));
        }
      },
    );
  }
}
