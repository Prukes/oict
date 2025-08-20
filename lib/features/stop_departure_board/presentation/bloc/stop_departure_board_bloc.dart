import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oict/features/stop_departure_board/data/departure_board_service.dart';
import 'package:oict/features/stop_departure_board/domain/departure_board_dto.dart';
import 'package:oict/network/dio_instance.dart';

part 'stop_departure_board_event.dart';
part 'stop_departure_board_state.dart';
part 'stop_departure_board_bloc.freezed.dart';

class StopDepartureBoardBloc extends Bloc<StopDepartureBoardEvent, StopDepartureBoardState> {
  final String stopId;
  final DepartureBoardService _service;
  StopDepartureBoardBloc({required this.stopId})
    : _service = DepartureBoardService(DioInstance.instance),
      super(StopDepartureBoardStateInitial(data: StopDepartureBoardStateData(departures: []))) {
    on<StopDepartureBoardEventStarted>((event, emit) async {
      try {
        final prepQuery = JsemLinyHovadoAJeSkoroPulnoc();
        prepQuery.addGroup([stopId]);
        final departures = await _service.getDepartureBoards(stopIds: prepQuery.getMap());
        emit(
          StopDepartureBoardStateSuccess(data: StopDepartureBoardStateData(departures: departures)),
        );
      } catch (e, stack) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: stack);
        emit(StopDepartureBoardStateError(message: e.toString(), data: state.data));
      }
    });
  }
}

//tohle tu absolutne nemusi bejt, cuz me zajima jenom jedna groupa, ale "future-proofing" lmao
class JsemLinyHovadoAJeSkoroPulnoc {
  final Map<String, List<String>> _stopIdsMap = <String, List<String>>{};

  void addGroup(List<String> stopIds) {
    final lastIndex = _stopIdsMap.length;
    _stopIdsMap['$lastIndex'] = stopIds;
  }

  Map<String, List<String>> getMap() => _stopIdsMap;
}
