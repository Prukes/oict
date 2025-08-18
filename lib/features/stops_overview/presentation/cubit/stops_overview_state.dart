part of 'stops_overview_cubit.dart';

@freezed
sealed class StopsOverviewState with _$StopsOverviewState {
  const factory StopsOverviewState.initial() = _StopsOverviewStateInitial;
}

@freezed
abstract class StopsOverviewStateData with _$StopsOverviewStateData {
  const factory StopsOverviewStateData() = _StopsOverviewStateData;
}
