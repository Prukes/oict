part of 'stops_overview_cubit.dart';

@freezed
sealed class StopsOverviewState with _$StopsOverviewState {
  const factory StopsOverviewState.initial({required StopsOverviewStateData data}) = StopsOverviewStateInitial;
  const factory StopsOverviewState.loading({required StopsOverviewStateData data}) = StopsOverviewStateLoading;
  const factory StopsOverviewState.success({required StopsOverviewStateData data}) = StopsOverviewStateSuccess;
  const factory StopsOverviewState.error({required StopsOverviewStateData data, required String errorMessage}) =
      StopsOverviewStateError;
}

@freezed
abstract class StopsOverviewStateData with _$StopsOverviewStateData {
  const factory StopsOverviewStateData({
    required PagingState<int, StopFeatureDto> pagingState,
    String? filter,
    bool? isFiltered,
    @Default(30) int limit,
    @Default(0) int offset,
  }) = _StopsOverviewStateData;
}
