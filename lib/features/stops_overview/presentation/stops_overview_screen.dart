import 'package:flutter/material.dart';
import 'package:oict/router/routes.dart';

class StopsOverviewScreen extends StatelessWidget {
  const StopsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () {
            StopDepartureBoardRouteData(stopId: 'hello').push(context);
          },
          child: Text('Go'),
        ),
      ),
    );
  }
}
