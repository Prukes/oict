import 'package:go_router/go_router.dart';
import 'package:oict/router/routes.dart';

class OictRouter {
  static final OictRouter _singleton = OictRouter._();
  factory OictRouter() {
    return _singleton;
  }
  OictRouter._();

  GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: StopsOverviewRouteData().location,
  );
}
