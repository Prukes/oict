import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/features/stops_overview/presentation/cubit/stops_overview_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:oict/features/stops_overview/presentation/widget/filter_dialog.dart';
import 'package:oict/router/routes.dart';

class StopsOverviewScreen extends StatelessWidget {
  const StopsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StopsOverviewCubit, StopsOverviewState>(
        listener: (context, state) async {
          switch (state) {
            case StopsOverviewStateOpenedFilter():
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
              break;
            default:
              break;
          }
        },
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
      ),
    );
  }
}
