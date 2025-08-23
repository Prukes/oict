import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_feature_collection_dto.freezed.dart';
part 'stop_feature_collection_dto.g.dart';

@freezed
abstract class StopFeatureCollectionDto with _$StopFeatureCollectionDto {
  const factory StopFeatureCollectionDto({
    required String type,
    required List<StopFeatureDto> features,
  }) = _StopFeatureCollectionDto;

  factory StopFeatureCollectionDto.fromJson(Map<String, dynamic> json) => _$StopFeatureCollectionDtoFromJson(json);
}

@freezed
abstract class StopFeatureDto with _$StopFeatureDto {
  const factory StopFeatureDto({
    required String type,
    required StopGeometryDto geometry,
    required StopPropertiesDto properties,
  }) = _StopFeatureDto;

  factory StopFeatureDto.fromJson(Map<String, dynamic> json) => _$StopFeatureDtoFromJson(json);
}

@freezed
abstract class StopGeometryDto with _$StopGeometryDto {
  const factory StopGeometryDto({
    required String type,
    required List<double> coordinates,
  }) = _StopGeometryDto;

  factory StopGeometryDto.fromJson(Map<String, dynamic> json) => _$StopGeometryDtoFromJson(json);
}

@freezed
abstract class StopPropertiesDto with _$StopPropertiesDto {
  const factory StopPropertiesDto({
    @JsonKey(name: 'location_type') required int locationType,
    @JsonKey(name: 'parent_station') String? parentStation,
    @JsonKey(name: 'platform_code') String? platformCode,
    @JsonKey(name: 'stop_id') required String stopId,
    @JsonKey(name: 'stop_name') String? stopName,
    @JsonKey(name: 'wheelchair_boarding') required int wheelchairBoarding,
    @JsonKey(name: 'zone_id') String? zoneId,
    @JsonKey(name: 'level_id') String? levelId,
  }) = _StopPropertiesDto;

  factory StopPropertiesDto.fromJson(Map<String, dynamic> json) => _$StopPropertiesDtoFromJson(json);
}
