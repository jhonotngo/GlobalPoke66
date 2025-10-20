// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) {
  return _PokemonDetail.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  @TypeListConverter()
  List<PokemonType> get types => throw _privateConstructorUsedError;
  @AbilityListConverter()
  List<PokemonAbility> get abilities => throw _privateConstructorUsedError;
  @StatsConverter()
  PokemonStats get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'sprites')
  @SpriteUrlConverter()
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailCopyWith<PokemonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailCopyWith<$Res> {
  factory $PokemonDetailCopyWith(
    PokemonDetail value,
    $Res Function(PokemonDetail) then,
  ) = _$PokemonDetailCopyWithImpl<$Res, PokemonDetail>;
  @useResult
  $Res call({
    int id,
    String name,
    int height,
    int weight,
    @TypeListConverter() List<PokemonType> types,
    @AbilityListConverter() List<PokemonAbility> abilities,
    @StatsConverter() PokemonStats stats,
    @JsonKey(name: 'sprites') @SpriteUrlConverter() String imageUrl,
  });

  $PokemonStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$PokemonDetailCopyWithImpl<$Res, $Val extends PokemonDetail>
    implements $PokemonDetailCopyWith<$Res> {
  _$PokemonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? abilities = null,
    Object? stats = null,
    Object? imageUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            height:
                null == height
                    ? _value.height
                    : height // ignore: cast_nullable_to_non_nullable
                        as int,
            weight:
                null == weight
                    ? _value.weight
                    : weight // ignore: cast_nullable_to_non_nullable
                        as int,
            types:
                null == types
                    ? _value.types
                    : types // ignore: cast_nullable_to_non_nullable
                        as List<PokemonType>,
            abilities:
                null == abilities
                    ? _value.abilities
                    : abilities // ignore: cast_nullable_to_non_nullable
                        as List<PokemonAbility>,
            stats:
                null == stats
                    ? _value.stats
                    : stats // ignore: cast_nullable_to_non_nullable
                        as PokemonStats,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonStatsCopyWith<$Res> get stats {
    return $PokemonStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailImplCopyWith<$Res>
    implements $PokemonDetailCopyWith<$Res> {
  factory _$$PokemonDetailImplCopyWith(
    _$PokemonDetailImpl value,
    $Res Function(_$PokemonDetailImpl) then,
  ) = __$$PokemonDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    int height,
    int weight,
    @TypeListConverter() List<PokemonType> types,
    @AbilityListConverter() List<PokemonAbility> abilities,
    @StatsConverter() PokemonStats stats,
    @JsonKey(name: 'sprites') @SpriteUrlConverter() String imageUrl,
  });

  @override
  $PokemonStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$PokemonDetailImplCopyWithImpl<$Res>
    extends _$PokemonDetailCopyWithImpl<$Res, _$PokemonDetailImpl>
    implements _$$PokemonDetailImplCopyWith<$Res> {
  __$$PokemonDetailImplCopyWithImpl(
    _$PokemonDetailImpl _value,
    $Res Function(_$PokemonDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? abilities = null,
    Object? stats = null,
    Object? imageUrl = null,
  }) {
    return _then(
      _$PokemonDetailImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        height:
            null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                    as int,
        weight:
            null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                    as int,
        types:
            null == types
                ? _value._types
                : types // ignore: cast_nullable_to_non_nullable
                    as List<PokemonType>,
        abilities:
            null == abilities
                ? _value._abilities
                : abilities // ignore: cast_nullable_to_non_nullable
                    as List<PokemonAbility>,
        stats:
            null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                    as PokemonStats,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDetailImpl implements _PokemonDetail {
  const _$PokemonDetailImpl({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    @TypeListConverter() required final List<PokemonType> types,
    @AbilityListConverter() required final List<PokemonAbility> abilities,
    @StatsConverter() required this.stats,
    @JsonKey(name: 'sprites') @SpriteUrlConverter() required this.imageUrl,
  }) : _types = types,
       _abilities = abilities;

  factory _$PokemonDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  final List<PokemonType> _types;
  @override
  @TypeListConverter()
  List<PokemonType> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonAbility> _abilities;
  @override
  @AbilityListConverter()
  List<PokemonAbility> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  @StatsConverter()
  final PokemonStats stats;
  @override
  @JsonKey(name: 'sprites')
  @SpriteUrlConverter()
  final String imageUrl;

  @override
  String toString() {
    return 'PokemonDetail(id: $id, name: $name, height: $height, weight: $weight, types: $types, abilities: $abilities, stats: $stats, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(
              other._abilities,
              _abilities,
            ) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    height,
    weight,
    const DeepCollectionEquality().hash(_types),
    const DeepCollectionEquality().hash(_abilities),
    stats,
    imageUrl,
  );

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailImplCopyWith<_$PokemonDetailImpl> get copyWith =>
      __$$PokemonDetailImplCopyWithImpl<_$PokemonDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailImplToJson(this);
  }
}

abstract class _PokemonDetail implements PokemonDetail {
  const factory _PokemonDetail({
    required final int id,
    required final String name,
    required final int height,
    required final int weight,
    @TypeListConverter() required final List<PokemonType> types,
    @AbilityListConverter() required final List<PokemonAbility> abilities,
    @StatsConverter() required final PokemonStats stats,
    @JsonKey(name: 'sprites')
    @SpriteUrlConverter()
    required final String imageUrl,
  }) = _$PokemonDetailImpl;

  factory _PokemonDetail.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  @TypeListConverter()
  List<PokemonType> get types;
  @override
  @AbilityListConverter()
  List<PokemonAbility> get abilities;
  @override
  @StatsConverter()
  PokemonStats get stats;
  @override
  @JsonKey(name: 'sprites')
  @SpriteUrlConverter()
  String get imageUrl;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailImplCopyWith<_$PokemonDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) {
  return _PokemonType.fromJson(json);
}

/// @nodoc
mixin _$PokemonType {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PokemonType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeCopyWith<PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeCopyWith<$Res> {
  factory $PokemonTypeCopyWith(
    PokemonType value,
    $Res Function(PokemonType) then,
  ) = _$PokemonTypeCopyWithImpl<$Res, PokemonType>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PokemonTypeCopyWithImpl<$Res, $Val extends PokemonType>
    implements $PokemonTypeCopyWith<$Res> {
  _$PokemonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonTypeImplCopyWith<$Res>
    implements $PokemonTypeCopyWith<$Res> {
  factory _$$PokemonTypeImplCopyWith(
    _$PokemonTypeImpl value,
    $Res Function(_$PokemonTypeImpl) then,
  ) = __$$PokemonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PokemonTypeImplCopyWithImpl<$Res>
    extends _$PokemonTypeCopyWithImpl<$Res, _$PokemonTypeImpl>
    implements _$$PokemonTypeImplCopyWith<$Res> {
  __$$PokemonTypeImplCopyWithImpl(
    _$PokemonTypeImpl _value,
    $Res Function(_$PokemonTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$PokemonTypeImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeImpl implements _PokemonType {
  const _$PokemonTypeImpl({required this.name});

  factory _$PokemonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'PokemonType(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeImplCopyWith<_$PokemonTypeImpl> get copyWith =>
      __$$PokemonTypeImplCopyWithImpl<_$PokemonTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeImplToJson(this);
  }
}

abstract class _PokemonType implements PokemonType {
  const factory _PokemonType({required final String name}) = _$PokemonTypeImpl;

  factory _PokemonType.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeImpl.fromJson;

  @override
  String get name;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeImplCopyWith<_$PokemonTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) {
  return _PokemonAbility.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbility {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilityCopyWith<PokemonAbility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilityCopyWith<$Res> {
  factory $PokemonAbilityCopyWith(
    PokemonAbility value,
    $Res Function(PokemonAbility) then,
  ) = _$PokemonAbilityCopyWithImpl<$Res, PokemonAbility>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PokemonAbilityCopyWithImpl<$Res, $Val extends PokemonAbility>
    implements $PokemonAbilityCopyWith<$Res> {
  _$PokemonAbilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonAbilityImplCopyWith<$Res>
    implements $PokemonAbilityCopyWith<$Res> {
  factory _$$PokemonAbilityImplCopyWith(
    _$PokemonAbilityImpl value,
    $Res Function(_$PokemonAbilityImpl) then,
  ) = __$$PokemonAbilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PokemonAbilityImplCopyWithImpl<$Res>
    extends _$PokemonAbilityCopyWithImpl<$Res, _$PokemonAbilityImpl>
    implements _$$PokemonAbilityImplCopyWith<$Res> {
  __$$PokemonAbilityImplCopyWithImpl(
    _$PokemonAbilityImpl _value,
    $Res Function(_$PokemonAbilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonAbility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$PokemonAbilityImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonAbilityImpl implements _PokemonAbility {
  const _$PokemonAbilityImpl({required this.name});

  factory _$PokemonAbilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilityImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'PokemonAbility(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilityImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PokemonAbility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilityImplCopyWith<_$PokemonAbilityImpl> get copyWith =>
      __$$PokemonAbilityImplCopyWithImpl<_$PokemonAbilityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilityImplToJson(this);
  }
}

abstract class _PokemonAbility implements PokemonAbility {
  const factory _PokemonAbility({required final String name}) =
      _$PokemonAbilityImpl;

  factory _PokemonAbility.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilityImpl.fromJson;

  @override
  String get name;

  /// Create a copy of PokemonAbility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilityImplCopyWith<_$PokemonAbilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStats _$PokemonStatsFromJson(Map<String, dynamic> json) {
  return _PokemonStats.fromJson(json);
}

/// @nodoc
mixin _$PokemonStats {
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get specialAttack => throw _privateConstructorUsedError;
  int get specialDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  /// Serializes this PokemonStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatsCopyWith<PokemonStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatsCopyWith<$Res> {
  factory $PokemonStatsCopyWith(
    PokemonStats value,
    $Res Function(PokemonStats) then,
  ) = _$PokemonStatsCopyWithImpl<$Res, PokemonStats>;
  @useResult
  $Res call({
    int hp,
    int attack,
    int defense,
    int specialAttack,
    int specialDefense,
    int speed,
  });
}

/// @nodoc
class _$PokemonStatsCopyWithImpl<$Res, $Val extends PokemonStats>
    implements $PokemonStatsCopyWith<$Res> {
  _$PokemonStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? specialAttack = null,
    Object? specialDefense = null,
    Object? speed = null,
  }) {
    return _then(
      _value.copyWith(
            hp:
                null == hp
                    ? _value.hp
                    : hp // ignore: cast_nullable_to_non_nullable
                        as int,
            attack:
                null == attack
                    ? _value.attack
                    : attack // ignore: cast_nullable_to_non_nullable
                        as int,
            defense:
                null == defense
                    ? _value.defense
                    : defense // ignore: cast_nullable_to_non_nullable
                        as int,
            specialAttack:
                null == specialAttack
                    ? _value.specialAttack
                    : specialAttack // ignore: cast_nullable_to_non_nullable
                        as int,
            specialDefense:
                null == specialDefense
                    ? _value.specialDefense
                    : specialDefense // ignore: cast_nullable_to_non_nullable
                        as int,
            speed:
                null == speed
                    ? _value.speed
                    : speed // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonStatsImplCopyWith<$Res>
    implements $PokemonStatsCopyWith<$Res> {
  factory _$$PokemonStatsImplCopyWith(
    _$PokemonStatsImpl value,
    $Res Function(_$PokemonStatsImpl) then,
  ) = __$$PokemonStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int hp,
    int attack,
    int defense,
    int specialAttack,
    int specialDefense,
    int speed,
  });
}

/// @nodoc
class __$$PokemonStatsImplCopyWithImpl<$Res>
    extends _$PokemonStatsCopyWithImpl<$Res, _$PokemonStatsImpl>
    implements _$$PokemonStatsImplCopyWith<$Res> {
  __$$PokemonStatsImplCopyWithImpl(
    _$PokemonStatsImpl _value,
    $Res Function(_$PokemonStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? specialAttack = null,
    Object? specialDefense = null,
    Object? speed = null,
  }) {
    return _then(
      _$PokemonStatsImpl(
        hp:
            null == hp
                ? _value.hp
                : hp // ignore: cast_nullable_to_non_nullable
                    as int,
        attack:
            null == attack
                ? _value.attack
                : attack // ignore: cast_nullable_to_non_nullable
                    as int,
        defense:
            null == defense
                ? _value.defense
                : defense // ignore: cast_nullable_to_non_nullable
                    as int,
        specialAttack:
            null == specialAttack
                ? _value.specialAttack
                : specialAttack // ignore: cast_nullable_to_non_nullable
                    as int,
        specialDefense:
            null == specialDefense
                ? _value.specialDefense
                : specialDefense // ignore: cast_nullable_to_non_nullable
                    as int,
        speed:
            null == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatsImpl extends _PokemonStats {
  const _$PokemonStatsImpl({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  }) : super._();

  factory _$PokemonStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatsImplFromJson(json);

  @override
  final int hp;
  @override
  final int attack;
  @override
  final int defense;
  @override
  final int specialAttack;
  @override
  final int specialDefense;
  @override
  final int speed;

  @override
  String toString() {
    return 'PokemonStats(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatsImpl &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.specialAttack, specialAttack) ||
                other.specialAttack == specialAttack) &&
            (identical(other.specialDefense, specialDefense) ||
                other.specialDefense == specialDefense) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hp,
    attack,
    defense,
    specialAttack,
    specialDefense,
    speed,
  );

  /// Create a copy of PokemonStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatsImplCopyWith<_$PokemonStatsImpl> get copyWith =>
      __$$PokemonStatsImplCopyWithImpl<_$PokemonStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatsImplToJson(this);
  }
}

abstract class _PokemonStats extends PokemonStats {
  const factory _PokemonStats({
    required final int hp,
    required final int attack,
    required final int defense,
    required final int specialAttack,
    required final int specialDefense,
    required final int speed,
  }) = _$PokemonStatsImpl;
  const _PokemonStats._() : super._();

  factory _PokemonStats.fromJson(Map<String, dynamic> json) =
      _$PokemonStatsImpl.fromJson;

  @override
  int get hp;
  @override
  int get attack;
  @override
  int get defense;
  @override
  int get specialAttack;
  @override
  int get specialDefense;
  @override
  int get speed;

  /// Create a copy of PokemonStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatsImplCopyWith<_$PokemonStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
