import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oict/exceptions/network_exceptions.dart';
import 'package:oict/features/stops_overview/domain/stop_feature_collection_dto.dart';
import 'package:oict/network/dio_client.dart';

class StopsOverviewService extends DioClient {
  final String path = '/v2/gtfs/stops';
  StopsOverviewService(super.dio);

  Future<StopFeatureCollectionDto> getStops({int limit = 10, int offset = 0, String? filter}) async {
    try {
      final response = await get(
        path,
        queryParameters: {'limit': limit, 'offset': offset, if (filter != null) 'names': filter},
      );
      if (response.statusCode == HttpStatus.ok && response.data != null) {
        return StopFeatureCollectionDto.fromJson(response.data! as Map<String, dynamic>);
      } else if (response.statusCode == HttpStatus.unauthorized) {
        throw UnauthorizedException();
      }
      throw Exception('Failed to load stops');
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.unauthorized:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException('Stops endpoint resource not found');
        default:
          throw Exception('Failed to load stops: ${e.message}');
      }
    }
  }
}
