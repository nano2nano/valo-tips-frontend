import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valo_tips/model/ability/ability.dart';

part 'agent.freezed.dart';
part 'agent.g.dart';

@freezed
class Agent with _$Agent {
  const factory Agent({
    @JsonKey(name: 'uuid') required String uuid,
    @JsonKey(name: 'displayName') required String displayName,
    @JsonKey(name: 'abilities') required List<Ability> abilities,
    @JsonKey(name: 'displayIcon') required String displayIcon,
  }) = _Agent;
  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
}
