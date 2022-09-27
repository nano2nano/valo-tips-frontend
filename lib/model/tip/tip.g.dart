// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tip _$$_TipFromJson(Map<String, dynamic> json) => _$_Tip(
      id: json['ID'] as int,
      title: json['Title'] as String,
      standImgPath: json['StandImgPath'] as String,
      aimImgPath: json['AimImgPath'] as String,
      iconName: json['IconName'] as String?,
      description: json['Description'] as String,
      sideId: json['SideID'] as int,
      mapUuid: json['MapUUID'] as String,
      agentUuid: json['AgentUUID'] as String,
      abilitySlot: json['AbilitySlot'] as String,
      good: json['Good'] as int? ?? 0,
      bad: json['Bad'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TipToJson(_$_Tip instance) => <String, dynamic>{
      'ID': instance.id,
      'Title': instance.title,
      'StandImgPath': instance.standImgPath,
      'AimImgPath': instance.aimImgPath,
      'IconName': instance.iconName,
      'Description': instance.description,
      'SideID': instance.sideId,
      'MapUUID': instance.mapUuid,
      'AgentUUID': instance.agentUuid,
      'AbilitySlot': instance.abilitySlot,
      'Good': instance.good,
      'Bad': instance.bad,
    };
