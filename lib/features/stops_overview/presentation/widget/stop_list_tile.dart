import 'package:flutter/material.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/router/routes.dart';

class StopListTile extends StatelessWidget {
  final StopFeatureDto stop;

  const StopListTile({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        StopDepartureBoardRouteData(stopId: stop.properties.stopId).push(context);
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Název: ${stop.properties.stopName}'),
          if (stop.properties.platformCode != null) Text('Platforma: ${stop.properties.platformCode}'),
          if (stop.properties.levelId != null) Text('Úroveň: ${stop.properties.levelId}'),
          if (stop.properties.zoneId != null) Text('Zóna: ${stop.properties.zoneId}'),
        ],
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_bus),
          Text('Typ umístění: ${stop.properties.locationType}'),

          if (stop.properties.parentStation != null) Text('parent station: ${stop.properties.parentStation}'),
        ],
      ),
    );
  }
}
