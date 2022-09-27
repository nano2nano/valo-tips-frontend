import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  // choice
  @Assert(
      'slot == "Ability1" || slot == "Ability2" || slot == "Grenade" || slot == "Ultimate" || slot == "Passive"')
  const factory Ability({
    @JsonKey(name: 'slot') required String slot,
    @JsonKey(name: 'displayName') required String displayName,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'displayIcon') String? displayIcon,
  }) = _Ability;
  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}
