//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_expense_location.g.dart';

/// ModelExpenseLocation
///
/// Properties:
/// * [id] 
/// * [name] 
@BuiltValue()
abstract class ModelExpenseLocation implements Built<ModelExpenseLocation, ModelExpenseLocationBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  ModelExpenseLocation._();

  factory ModelExpenseLocation([void updates(ModelExpenseLocationBuilder b)]) = _$ModelExpenseLocation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelExpenseLocationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelExpenseLocation> get serializer => _$ModelExpenseLocationSerializer();
}

class _$ModelExpenseLocationSerializer implements PrimitiveSerializer<ModelExpenseLocation> {
  @override
  final Iterable<Type> types = const [ModelExpenseLocation, _$ModelExpenseLocation];

  @override
  final String wireName = r'ModelExpenseLocation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelExpenseLocation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ModelExpenseLocation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ModelExpenseLocationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ModelExpenseLocation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelExpenseLocationBuilder();
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

