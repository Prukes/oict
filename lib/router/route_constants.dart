// ignore_for_file: non_constant_identifier_names

class RouteConstants {
  static const STOPS_OVERVIEW_PATH = '/';
  static const STOPS_OVERVIEW_NAME = 'stops-overview';
  static const STOPS_OVERVIEW_TITLE = 'Seznam zastávek';

  static const STOP_DEPARTURE_BOARD_PATH = ':stopId';
  static const STOP_DEPARTURE_BOARD_NAME = 'stop-departure-board';
  static const STOP_DEPARTURE_BOARD_TITLE = 'Odjezdy ze zastávky';

  static const VEHICLE_MAP_PATH = ':stopId/map/:vehicleId';
  static const VEHICLE_MAP_NAME = 'vehicle-map';
  static const VEHICLE_MAP_TITLE = 'Aktuální poloha vozidla';
}
