import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stops_overview_state.dart';
part 'stops_overview_cubit.freezed.dart';

class StopsOverviewCubit extends Cubit<StopsOverviewState> {
  StopsOverviewCubit() : super(StopsOverviewState.initial());
}
