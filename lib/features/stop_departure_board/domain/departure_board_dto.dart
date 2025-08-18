import 'package:freezed_annotation/freezed_annotation.dart';

part 'departure_board_dto.freezed.dart';
part 'departure_board_dto.g.dart';

@freezed
abstract class PublicDepartureGroupDto with _$PublicDepartureGroupDto {
  const factory PublicDepartureGroupDto({
    required List<PublicDepartureGroupItemDto> group,
  }) = _PublicDepartureGroupDto;

  factory PublicDepartureGroupDto.fromJson(List<dynamic> json) => PublicDepartureGroupDto(
    group: json.map((item) => PublicDepartureGroupItemDto.fromJson(item as Map<String, dynamic>)).toList(),
  );
}

@freezed
abstract class PublicDepartureGroupItemDto with _$PublicDepartureGroupItemDto {
  const factory PublicDepartureGroupItemDto({
    required PublicDepartureDto departure,
    required PublicDepartureStopDto stop,
    required PublicDepartureRouteDto route,
    required PublicDepartureTripDto trip,
    required PublicDepartureVehicleDto vehicle,
  }) = _PublicDepartureGroupItemDto;

  factory PublicDepartureGroupItemDto.fromJson(Map<String, dynamic> json) =>
      _$PublicDepartureGroupItemDtoFromJson(json);
}

@freezed
abstract class PublicDepartureDto with _$PublicDepartureDto {
  const factory PublicDepartureDto({
    @JsonKey(name: 'timestamp_scheduled') required String timestampScheduled,
    @JsonKey(name: 'timestamp_predicted') required String timestampPredicted,
    int? delay_seconds,
    required int minutes,
  }) = _PublicDepartureDto;

  factory PublicDepartureDto.fromJson(Map<String, dynamic> json) => _$PublicDepartureDtoFromJson(json);
}

@freezed
abstract class PublicDepartureStopDto with _$PublicDepartureStopDto {
  const factory PublicDepartureStopDto({
    required String id,
    required int sequence,
    String? platform_code,
  }) = _PublicDepartureStopDto;

  factory PublicDepartureStopDto.fromJson(Map<String, dynamic> json) => _$PublicDepartureStopDtoFromJson(json);
}

@freezed
abstract class PublicDepartureRouteDto with _$PublicDepartureRouteDto {
  const factory PublicDepartureRouteDto({
    required String type,
    @JsonKey(name: 'short_name') required String shortName,
  }) = _PublicDepartureRouteDto;

  factory PublicDepartureRouteDto.fromJson(Map<String, dynamic> json) => _$PublicDepartureRouteDtoFromJson(json);
}

@freezed
abstract class PublicDepartureTripDto with _$PublicDepartureTripDto {
  const factory PublicDepartureTripDto({
    required String id,
    required String headsign,
    @JsonKey(name: 'is_canceled') bool? isCanceled,
  }) = _PublicDepartureTripDto;

  factory PublicDepartureTripDto.fromJson(Map<String, dynamic> json) => _$PublicDepartureTripDtoFromJson(json);
}

@freezed
abstract class PublicDepartureVehicleDto with _$PublicDepartureVehicleDto {
  const factory PublicDepartureVehicleDto({
    String? id,
    @JsonKey(name: 'is_wheelchair_accessible') bool? isWheelchairAccessible,
    @JsonKey(name: 'is_air_conditioned') bool? isAirConditioned,
    @JsonKey(name: 'has_charger') bool? hasCharger,
  }) = _PublicDepartureVehicleDto;

  factory PublicDepartureVehicleDto.fromJson(Map<String, dynamic> json) => _$PublicDepartureVehicleDtoFromJson(json);
}
