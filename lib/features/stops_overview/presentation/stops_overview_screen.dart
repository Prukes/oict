import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/features/stops_overview/presentation/cubit/stops_overview_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:oict/router/routes.dart';

class StopsOverviewScreen extends StatelessWidget {
  const StopsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopsOverviewCubit, StopsOverviewState>(
      builder: (context, state) {
        return SafeArea(
          child: PagedListView<int, StopFeatureDto>.separated(
            state: state.data.pagingState,
            fetchNextPage: context.read<StopsOverviewCubit>().loadStops,

            builderDelegate: PagedChildBuilderDelegate(
              firstPageErrorIndicatorBuilder: (context) {
                return Center(child: Text((state as StopsOverviewStateError).errorMessage));
              },
              newPageErrorIndicatorBuilder: (context) {
                return Center(child: Text((state as StopsOverviewStateError).errorMessage));
              },
              itemBuilder: (context, item, index) {
                return ListTile(
                  onTap: () {
                    StopDepartureBoardRouteData(stopId: item.properties.stopId).push(context);
                  },
                  title: Text(item.toString()),
                );
              },
            ),
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        );
      },
    );
  }
}
