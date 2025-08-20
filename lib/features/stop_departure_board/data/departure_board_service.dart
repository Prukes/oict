import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oict/exceptions/network_exceptions.dart';
import 'package:oict/features/stop_departure_board/domain/departure_board_dto.dart';
import 'package:oict/network/dio_client.dart';

class DepartureBoardService extends DioClient {
  final String path = '/v2/public/departureboards';
  DepartureBoardService(super.dio);
  Future<List<PublicDepartureGroupDto>> getDepartureBoards({
    required Map<String, List<String>> stopIds,
    int? limit,
  }) async {
    try {
      final response = await get(
        path,
        queryParameters: {
          'stopIds': jsonEncode(stopIds),

          //tady byly nejaky data
          // 'stopIds': jsonEncode({
          //   '0': ['U118Z102P'],
          // }),
          if (limit != null) 'limit': limit,
          'minutesAfter': 360,
        },
      );
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List).map((item) => PublicDepartureGroupDto.fromJson(item as List)).toList();
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw Exception('Failed to load departure boards');
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException('Departure boards endpoint resource not found');
        default:
          throw Exception('Failed to load departure boards: ${e.message}');
      }
    }
  }
}
