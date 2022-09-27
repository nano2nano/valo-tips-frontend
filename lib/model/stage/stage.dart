import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage.freezed.dart';
part 'stage.g.dart';

@freezed
class Stage with _$Stage {
  const factory Stage({
    @JsonKey(name: "uuid") required String uuid,
    @JsonKey(name: "displayName") required String displayName,
    @JsonKey(name: "coordinates") required String coordinates,
    @JsonKey(name: "displayIcon") String? displayIcon,
    @JsonKey(name: "listViewIcon") required String listViewIcon,
    @JsonKey(name: "splash") required String splash,
    @JsonKey(name: "assetPath") required String assetPath,
    @JsonKey(name: "mapUrl") required String mapUrl,
    @JsonKey(name: "xMultiplier") required double xMultiplier,
    @JsonKey(name: "yMultiplier") required double yMultiplier,
    @JsonKey(name: "xScalarToAdd") required double xScalarToAdd,
    @JsonKey(name: "yScalarToAdd") required double yScalarToAdd,
  }) = _Stage;
  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}
