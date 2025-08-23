import 'dart:async';

import 'package:oict/helpers/app_event.dart';

class AppEventBus {
  AppEventBus._();
  static final AppEventBus instance = AppEventBus._();
  final _eventStreamController = StreamController<AppEvent>();

  Stream<AppEvent> get events => _eventStreamController.stream;

  void emit(AppEvent event) {
    _eventStreamController.add(event);
  }

  void dispose() {
    _eventStreamController.close();
  }
}
