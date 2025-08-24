import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/features/stops_overview/presentation/cubit/stops_overview_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:oict/features/stops_overview/presentation/widget/filter_dialog.dart';
import 'package:oict/features/stops_overview/presentation/widget/stop_list_tile.dart';
import 'package:oict/router/route_constants.dart';
import 'package:oict/router/routes.dart';

class StopsOverviewScreen extends StatelessWidget {
  const StopsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RouteConstants.STOPS_OVERVIEW_TITLE),
        actions: [
          BlocSelector<StopsOverviewCubit, StopsOverviewState, bool?>(
            selector: (state) {
              return state.data.isFiltered;
            },
            builder: (context, isFiltered) {
              return !(isFiltered ?? false)
                  ? IconButton(
                      onPressed: () async {
                        final filter = await showDialog(
                          fullscreenDialog: true,
                          context: context,
                          builder: (context) {
                            return const FilterDialog();
                          },
                        );
                        if (context.mounted) {
                          context.read<StopsOverviewCubit>().applyFilter(filter);
                        }
                      },
                      icon: const Icon(Icons.filter_list),
                    )
                  : IconButton(
                      onPressed: () async {
                        context.read<StopsOverviewCubit>().removeFilter();
                      },
                      icon: const Icon(Icons.filter_list_off),
                    );
            },
          ),
        ],
      ),
      body: BlocBuilder<StopsOverviewCubit, StopsOverviewState>(
        builder: (context, state) {
          return SafeArea(
            child: PagedListView<int, StopFeatureDto>.separated(
              state: state.data.pagingState,
              fetchNextPage: context.read<StopsOverviewCubit>().loadStops,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageErrorIndicatorBuilder: (context) {
                  return Center(child: Text('Chyba při načítání první stránky'));
                },
                newPageErrorIndicatorBuilder: (context) {
                  return Center(child: Text('Chyba při načítání další stránky'));
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return Center(child: Text('Nebyly nalezeny žádné zastávky'));
                },
                itemBuilder: (context, item, index) {
                  return StopListTile(
                    stop: item,
                  );
                },
              ),
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          );
        },
      ),
    );
  }
}
