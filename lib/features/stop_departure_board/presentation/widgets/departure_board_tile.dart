import 'package:flutter/material.dart';
import 'package:oict/features/stop_departure_board/domain/departure_board_dto.dart';
import 'package:oict/router/routes.dart';

class DepartureBoardTile extends StatelessWidget {
  const DepartureBoardTile({super.key, required this.item});

  final PublicDepartureGroupItemDto item;

  @override
  Widget build(BuildContext context) {
    final scheduled = DateTime.tryParse(item.departure.timestampScheduled)?.toLocal();
    final predicted = DateTime.tryParse(item.departure.timestampPredicted)?.toLocal();

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Column(
              children: [
                Text('Číslo spoje: ${item.route.shortName}'),
                Text('Směr: ${item.trip.headsign}'),
                if (item.stop.platformCode != null) Text('Platforma: ${item.stop.platformCode}'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Odjezd za: ${item.departure.minutes} minut',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Čas odjezdu: ${scheduled != null ? '${scheduled.hour}:${scheduled.minute}' : '---'}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Předpokládaný čas odjezdu: ${predicted != null ? '${predicted.hour}:${predicted.minute}' : '---'}',
                  textAlign: TextAlign.center,
                ),
                if (item.departure.delay_seconds != null)
                  Text(
                    '${item.departure.delay_seconds! >= 0 ? 'Zpoždění:' : 'Zpožděnín\'t:'} ${item.departure.delay_seconds != null ? '${item.departure.delay_seconds} sekund' : '---'}',
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ],
      ),
      trailing: item.vehicle.id != null ? const Icon(Icons.map) : null,
      onTap: item.vehicle.id != null
          ? () {
              if (item.vehicle.id != null) {
                VehicleMapRouteData(
                  stopId: item.stop.id,
                  vehicleId: item.vehicle.id!,
                ).push(context);
              }
            }
          : null,
    );
  }
}
