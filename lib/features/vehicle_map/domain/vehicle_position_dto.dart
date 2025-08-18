import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_position_dto.freezed.dart';
part 'vehicle_position_dto.g.dart';

@freezed
abstract class PublicVehiclePositionDto with _$PublicVehiclePositionDto {
  const factory PublicVehiclePositionDto({
    // ScopeInfo
    @JsonKey(name: 'gtfs_trip_id') required String gtfsTripId,
    @JsonKey(name: 'route_type') required String routeType,
    @JsonKey(name: 'route_short_name') required String routeShortName,
    @JsonKey(name: 'shape_id') String? shapeId,
    @JsonKey(name: 'origin_route_name') String? originRouteName,
    @JsonKey(name: 'run_number') int? runNumber,
    @JsonKey(name: 'trip_headsign') String? tripHeadSign,
    GeometryPointDto? geometry,
    @JsonKey(name: 'shape_dist_traveled') double? shapeDistTraveled,
    int? bearing,
    int? delay,
    @JsonKey(name: 'state_position') String? statePosition,
    @JsonKey(name: 'last_stop_sequence') int? lastStopSequence,
    @JsonKey(name: 'origin_timestamp') String? originTimestamp,

    // ScopeStopTimes
    @JsonKey(name: 'stop_times') PublicTripStopTimeFeatureCollectionDto? stopTimes,

    // ScopeShapes
    PublicTripShapeFeatureCollectionDto? shapes,

    // ScopeVehicleDescriptor
    @JsonKey(name: 'vehicle_descriptor') VehicleDescriptorDto? vehicleDescriptor,
  }) = _PublicVehiclePositionDto;

  factory PublicVehiclePositionDto.fromJson(Map<String, dynamic> json) => _$PublicVehiclePositionDtoFromJson(json);
}

@freezed
abstract class GeometryPointDto with _$GeometryPointDto {
  const factory GeometryPointDto({
    required String type,
    required List<double> coordinates,
  }) = _GeometryPointDto;

  factory GeometryPointDto.fromJson(Map<String, dynamic> json) => _$GeometryPointDtoFromJson(json);
}

@freezed
abstract class PublicTripStopTimeFeatureCollectionDto with _$PublicTripStopTimeFeatureCollectionDto {
  const factory PublicTripStopTimeFeatureCollectionDto({
    required String type,
    required List<PublicTripStopTimeFeatureDto> features,
  }) = _PublicTripStopTimeFeatureCollectionDto;

  factory PublicTripStopTimeFeatureCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$PublicTripStopTimeFeatureCollectionDtoFromJson(json);
}

@freezed
abstract class PublicTripStopTimeFeatureDto with _$PublicTripStopTimeFeatureDto {
  const factory PublicTripStopTimeFeatureDto({
    required String type,
    required GeometryPointDto geometry,
    required PublicTripStopTimePropertiesDto properties,
  }) = _PublicTripStopTimeFeatureDto;

  factory PublicTripStopTimeFeatureDto.fromJson(Map<String, dynamic> json) =>
      _$PublicTripStopTimeFeatureDtoFromJson(json);
}

@freezed
abstract class PublicTripStopTimePropertiesDto with _$PublicTripStopTimePropertiesDto {
  const factory PublicTripStopTimePropertiesDto({
    @JsonKey(name: 'stop_name') required String stopName,
    @JsonKey(name: 'stop_sequence') required int stopSequence,
    @JsonKey(name: 'zone_id') String? zoneId,
    @JsonKey(name: 'is_wheelchair_accessible') bool? isWheelchairAccessible,
    @JsonKey(name: 'shape_dist_traveled') required double shapeDistTraveled,
    @JsonKey(name: 'arrival_time') required String arrivalTime,
    @JsonKey(name: 'departure_time') required String departureTime,
    @JsonKey(name: 'realtime_arrival_time') String? realtimeArrivalTime,
    @JsonKey(name: 'realtime_departure_time') String? realtimeDepartureTime,
  }) = _PublicTripStopTimePropertiesDto;

  factory PublicTripStopTimePropertiesDto.fromJson(Map<String, dynamic> json) =>
      _$PublicTripStopTimePropertiesDtoFromJson(json);
}

@freezed
abstract class PublicTripShapeFeatureCollectionDto with _$PublicTripShapeFeatureCollectionDto {
  const factory PublicTripShapeFeatureCollectionDto({
    required String type,
    required List<PublicTripShapeFeatureDto> features,
  }) = _PublicTripShapeFeatureCollectionDto;

  factory PublicTripShapeFeatureCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$PublicTripShapeFeatureCollectionDtoFromJson(json);
}

@freezed
abstract class PublicTripShapeFeatureDto with _$PublicTripShapeFeatureDto {
  const factory PublicTripShapeFeatureDto({
    required String type,
    required GeometryPointDto geometry,
    required PublicTripShapePropertiesDto properties,
  }) = _PublicTripShapeFeatureDto;

  factory PublicTripShapeFeatureDto.fromJson(Map<String, dynamic> json) => _$PublicTripShapeFeatureDtoFromJson(json);
}

@freezed
abstract class PublicTripShapePropertiesDto with _$PublicTripShapePropertiesDto {
  const factory PublicTripShapePropertiesDto({
    @JsonKey(name: 'shape_dist_traveled') required double shapeDistTraveled,
  }) = _PublicTripShapePropertiesDto;

  factory PublicTripShapePropertiesDto.fromJson(Map<String, dynamic> json) =>
      _$PublicTripShapePropertiesDtoFromJson(json);
}

@freezed
abstract class VehicleDescriptorDto with _$VehicleDescriptorDto {
  const factory VehicleDescriptorDto({
    String? operator,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'is_wheelchair_accessible') bool? isWheelchairAccessible,
    @JsonKey(name: 'is_air_conditioned') bool? isAirConditioned,
    @JsonKey(name: 'has_usb_chargers') bool? hasUsbChargers,
    @JsonKey(name: 'vehicle_registration_number') String? vehicleRegistrationNumber,
  }) = _VehicleDescriptorDto;

  factory VehicleDescriptorDto.fromJson(Map<String, dynamic> json) => _$VehicleDescriptorDtoFromJson(json);
}
