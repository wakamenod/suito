//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'gorm_deleted_at.g.dart';

/// GormDeletedAt
///
/// Properties:
/// * [time] 
/// * [valid] - Valid is true if Time is not NULL
@BuiltValue()
abstract class GormDeletedAt implements Built<GormDeletedAt, GormDeletedAtBuilder> {
  @BuiltValueField(wireName: r'time')
  String? get time;

  /// Valid is true if Time is not NULL
  @BuiltValueField(wireName: r'valid')
  bool? get valid;

  GormDeletedAt._();

  factory GormDeletedAt([void updates(GormDeletedAtBuilder b)]) = _$GormDeletedAt;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GormDeletedAtBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GormDeletedAt> get serializer => _$GormDeletedAtSerializer();
}

class _$GormDeletedAtSerializer implements PrimitiveSerializer<GormDeletedAt> {
  @override
  final Iterable<Type> types = const [GormDeletedAt, _$GormDeletedAt];

  @override
  final String wireName = r'GormDeletedAt';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GormDeletedAt object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.time != null) {
      yield r'time';
      yield serializers.serialize(
        object.time,
        specifiedType: const FullType(String),
      );
    }
    if (object.valid != null) {
      yield r'valid';
      yield serializers.serialize(
        object.valid,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GormDeletedAt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GormDeletedAtBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.time = valueDes;
          break;
        case r'valid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.valid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GormDeletedAt deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GormDeletedAtBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

