import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oict/features/stops_overview/data/stops_overview_service.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/helpers/app_event.dart';
import 'package:oict/helpers/app_event_bus.dart';
import 'package:oict/network/dio_instance.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'stops_overview_state.dart';
part 'stops_overview_cubit.freezed.dart';

class StopsOverviewCubit extends Cubit<StopsOverviewState> {
  final StopsOverviewService _service;
  late final StreamSubscription<AppEvent> listener;
  StopsOverviewCubit()
    : _service = StopsOverviewService(DioInstance.instance),
      super(StopsOverviewState.initial(data: StopsOverviewStateData(pagingState: PagingState()))) {
    listener = AppEventBus.instance.events.listen(
      (event) {
        if (event is FilterClicked) {
          if (state.data.filter == null || (state.data.filter?.isEmpty ?? true)) {
            emit(StopsOverviewState.openedFilter(data: state.data));
          } else {
            emit(StopsOverviewState.success(data: state.data.copyWith(filter: null)));
          }
        }
      },
    );
  }

  void loadStops() async {
    try {
      if (state.data.pagingState.isLoading) return; // Prevent multiple simultaneous requests
      final newKey = (state.data.pagingState.keys?.last ?? 0) + 1;
      final stops = await _service.getStops(
        limit: state.data.limit,
        offset: state.data.offset,
        filter: state.data.filter,
      );
      final isLastPage = stops.features.isEmpty;
      emit(
        StopsOverviewState.success(
          data: StopsOverviewStateData(
            pagingState: state.data.pagingState.copyWith(
              hasNextPage: !isLastPage,
              keys: [...?state.data.pagingState.keys, newKey],
              pages: [...?state.data.pagingState.pages, stops.features],
              isLoading: false,
            ),
            offset: state.data.offset + state.data.limit,
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      emit(
        StopsOverviewState.error(
          data: state.data.copyWith(
            pagingState: state.data.pagingState.copyWith(isLoading: false, error: e),
          ),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void applyFilter(String? filter) {
    if (filter == null || filter.isEmpty) {
      emit(StopsOverviewState.success(data: state.data));
    } else {
      emit(
        StopsOverviewState.success(
          data: state.data.copyWith(pagingState: PagingState(), filter: filter),
        ),
      );
      loadStops();
    }
  }
}
