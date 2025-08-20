import 'package:dio/dio.dart';
import 'package:oict/exceptions/network_exceptions.dart';
import 'package:oict/features/vehicle_map/domain/vehicle_position_dto.dart';
import 'package:oict/network/dio_client.dart';

class VehicleMapService extends DioClient {
  final String path = '/v2/public/vehiclepositions';
  VehicleMapService(super.dio);

  Future<PublicVehiclePositionDto> getVehiclePosition(String vehicleId) async {
    try {
      final response = await get('$path/$vehicleId');
      if (response.statusCode == 200 && response.data != null) {
        return PublicVehiclePositionDto.fromJson(response.data);
      }
      throw Exception('Failed to load vehicle position');
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException('Vehicle position resource not found');
        default:
          throw Exception('Failed to load vehicle position: ${e.message}');
      }
    }
  }
}
