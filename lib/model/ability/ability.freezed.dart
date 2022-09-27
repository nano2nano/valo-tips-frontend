// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return _Ability.fromJson(json);
}

/// @nodoc
mixin _$Ability {
  @JsonKey(name: 'slot')
  String get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayIcon')
  String? get displayIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbilityCopyWith<Ability> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityCopyWith<$Res> {
  factory $AbilityCopyWith(Ability value, $Res Function(Ability) then) =
      _$AbilityCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'slot') String slot,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'displayIcon') String? displayIcon});
}

/// @nodoc
class _$AbilityCopyWithImpl<$Res> implements $AbilityCopyWith<$Res> {
  _$AbilityCopyWithImpl(this._value, this._then);

  final Ability _value;
  // ignore: unused_field
  final $Res Function(Ability) _then;

  @override
  $Res call({
    Object? slot = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? displayIcon = freezed,
  }) {
    return _then(_value.copyWith(
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      displayIcon: displayIcon == freezed
          ? _value.displayIcon
          : displayIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AbilityCopyWith<$Res> implements $AbilityCopyWith<$Res> {
  factory _$$_AbilityCopyWith(
          _$_Ability value, $Res Function(_$_Ability) then) =
      __$$_AbilityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'slot') String slot,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'displayIcon') String? displayIcon});
}

/// @nodoc
class __$$_AbilityCopyWithImpl<$Res> extends _$AbilityCopyWithImpl<$Res>
    implements _$$_AbilityCopyWith<$Res> {
  __$$_AbilityCopyWithImpl(_$_Ability _value, $Res Function(_$_Ability) _then)
      : super(_value, (v) => _then(v as _$_Ability));

  @override
  _$_Ability get _value => super._value as _$_Ability;

  @override
  $Res call({
    Object? slot = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? displayIcon = freezed,
  }) {
    return _then(_$_Ability(
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      displayIcon: displayIcon == freezed
          ? _value.displayIcon
          : displayIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ability implements _Ability {
  const _$_Ability(
      {@JsonKey(name: 'slot') required this.slot,
      @JsonKey(name: 'displayName') required this.displayName,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'displayIcon') this.displayIcon})
      : assert(slot == "Ability1" ||
            slot == "Ability2" ||
            slot == "Grenade" ||
            slot == "Ultimate" ||
            slot == "Passive");

  factory _$_Ability.fromJson(Map<String, dynamic> json) =>
      _$$_AbilityFromJson(json);

  @override
  @JsonKey(name: 'slot')
  final String slot;
  @override
  @JsonKey(name: 'displayName')
  final String displayName;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'displayIcon')
  final String? displayIcon;

  @override
  String toString() {
    return 'Ability(slot: $slot, displayName: $displayName, description: $description, displayIcon: $displayIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ability &&
            const DeepCollectionEquality().equals(other.slot, slot) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.displayIcon, displayIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(slot),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(displayIcon));

  @JsonKey(ignore: true)
  @override
  _$$_AbilityCopyWith<_$_Ability> get copyWith =>
      __$$_AbilityCopyWithImpl<_$_Ability>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbilityToJson(
      this,
    );
  }
}

abstract class _Ability implements Ability {
  const factory _Ability(
      {@JsonKey(name: 'slot') required final String slot,
      @JsonKey(name: 'displayName') required final String displayName,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'displayIcon') final String? displayIcon}) = _$_Ability;

  factory _Ability.fromJson(Map<String, dynamic> json) = _$_Ability.fromJson;

  @override
  @JsonKey(name: 'slot')
  String get slot;
  @override
  @JsonKey(name: 'displayName')
  String get displayName;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'displayIcon')
  String? get displayIcon;
  @override
  @JsonKey(ignore: true)
  _$$_AbilityCopyWith<_$_Ability> get copyWith =>
      throw _privateConstructorUsedError;
}
