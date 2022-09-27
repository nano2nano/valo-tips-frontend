// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stage _$$_StageFromJson(Map<String, dynamic> json) => _$_Stage(
      uuid: json['uuid'] as String,
      displayName: json['displayName'] as String,
      coordinates: json['coordinates'] as String,
      displayIcon: json['displayIcon'] as String?,
      listViewIcon: json['listViewIcon'] as String,
      splash: json['splash'] as String,
      assetPath: json['assetPath'] as String,
      mapUrl: json['mapUrl'] as String,
      xMultiplier: (json['xMultiplier'] as num).toDouble(),
      yMultiplier: (json['yMultiplier'] as num).toDouble(),
      xScalarToAdd: (json['xScalarToAdd'] as num).toDouble(),
      yScalarToAdd: (json['yScalarToAdd'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StageToJson(_$_Stage instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'coordinates': instance.coordinates,
      'displayIcon': instance.displayIcon,
      'listViewIcon': instance.listViewIcon,
      'splash': instance.splash,
      'assetPath': instance.assetPath,
      'mapUrl': instance.mapUrl,
      'xMultiplier': instance.xMultiplier,
      'yMultiplier': instance.yMultiplier,
      'xScalarToAdd': instance.xScalarToAdd,
      'yScalarToAdd': instance.yScalarToAdd,
    };
