import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip.freezed.dart';
part 'tip.g.dart';

@freezed
class Tip with _$Tip {
  const factory Tip({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Title') required String title,
    @JsonKey(name: 'StandImgPath') required String standImgPath,
    @JsonKey(name: 'AimImgPath') required String aimImgPath,
    @JsonKey(name: 'IconName') String? iconName,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'SideID') required int sideId,
    @JsonKey(name: 'MapUUID') required String mapUuid,
    @JsonKey(name: 'AgentUUID') required String agentUuid,
    @JsonKey(name: 'AbilitySlot') required String abilitySlot,
    @JsonKey(name: 'Good') @Default(0) int good,
    @JsonKey(name: 'Bad') @Default(0) int bad,
  }) = _Tip;
  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
}
