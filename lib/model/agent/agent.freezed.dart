// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Agent _$AgentFromJson(Map<String, dynamic> json) {
  return _Agent.fromJson(json);
}

/// @nodoc
mixin _$Agent {
  @JsonKey(name: 'uuid')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'abilities')
  List<Ability> get abilities => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayIcon')
  String get displayIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgentCopyWith<Agent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) then) =
      _$AgentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'abilities') List<Ability> abilities,
      @JsonKey(name: 'displayIcon') String displayIcon});
}

/// @nodoc
class _$AgentCopyWithImpl<$Res> implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._value, this._then);

  final Agent _value;
  // ignore: unused_field
  final $Res Function(Agent) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? displayName = freezed,
    Object? abilities = freezed,
    Object? displayIcon = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      abilities: abilities == freezed
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      displayIcon: displayIcon == freezed
          ? _value.displayIcon
          : displayIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AgentCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$$_AgentCopyWith(_$_Agent value, $Res Function(_$_Agent) then) =
      __$$_AgentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'abilities') List<Ability> abilities,
      @JsonKey(name: 'displayIcon') String displayIcon});
}

/// @nodoc
class __$$_AgentCopyWithImpl<$Res> extends _$AgentCopyWithImpl<$Res>
    implements _$$_AgentCopyWith<$Res> {
  __$$_AgentCopyWithImpl(_$_Agent _value, $Res Function(_$_Agent) _then)
      : super(_value, (v) => _then(v as _$_Agent));

  @override
  _$_Agent get _value => super._value as _$_Agent;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? displayName = freezed,
    Object? abilities = freezed,
    Object? displayIcon = freezed,
  }) {
    return _then(_$_Agent(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      abilities: abilities == freezed
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      displayIcon: displayIcon == freezed
          ? _value.displayIcon
          : displayIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Agent implements _Agent {
  const _$_Agent(
      {@JsonKey(name: 'uuid') required this.uuid,
      @JsonKey(name: 'displayName') required this.displayName,
      @JsonKey(name: 'abilities') required final List<Ability> abilities,
      @JsonKey(name: 'displayIcon') required this.displayIcon})
      : _abilities = abilities;

  factory _$_Agent.fromJson(Map<String, dynamic> json) =>
      _$$_AgentFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String uuid;
  @override
  @JsonKey(name: 'displayName')
  final String displayName;
  final List<Ability> _abilities;
  @override
  @JsonKey(name: 'abilities')
  List<Ability> get abilities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  @JsonKey(name: 'displayIcon')
  final String displayIcon;

  @override
  String toString() {
    return 'Agent(uuid: $uuid, displayName: $displayName, abilities: $abilities, displayIcon: $displayIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Agent &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            const DeepCollectionEquality()
                .equals(other.displayIcon, displayIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(_abilities),
      const DeepCollectionEquality().hash(displayIcon));

  @JsonKey(ignore: true)
  @override
  _$$_AgentCopyWith<_$_Agent> get copyWith =>
      __$$_AgentCopyWithImpl<_$_Agent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgentToJson(
      this,
    );
  }
}

abstract class _Agent implements Agent {
  const factory _Agent(
          {@JsonKey(name: 'uuid') required final String uuid,
          @JsonKey(name: 'displayName') required final String displayName,
          @JsonKey(name: 'abilities') required final List<Ability> abilities,
          @JsonKey(name: 'displayIcon') required final String displayIcon}) =
      _$_Agent;

  factory _Agent.fromJson(Map<String, dynamic> json) = _$_Agent.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String get uuid;
  @override
  @JsonKey(name: 'displayName')
  String get displayName;
  @override
  @JsonKey(name: 'abilities')
  List<Ability> get abilities;
  @override
  @JsonKey(name: 'displayIcon')
  String get displayIcon;
  @override
  @JsonKey(ignore: true)
  _$$_AgentCopyWith<_$_Agent> get copyWith =>
      throw _privateConstructorUsedError;
}
