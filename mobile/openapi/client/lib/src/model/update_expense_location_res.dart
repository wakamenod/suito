//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_location_res.g.dart';

/// UpdateExpenseLocationRes
///
/// Properties:
/// * [updatedExpenseLocation] 
@BuiltValue()
abstract class UpdateExpenseLocationRes implements Built<UpdateExpenseLocationRes, UpdateExpenseLocationResBuilder> {
  @BuiltValueField(wireName: r'updatedExpenseLocation')
  ModelExpenseLocation get updatedExpenseLocation;

  UpdateExpenseLocationRes._();

  factory UpdateExpenseLocationRes([void updates(UpdateExpenseLocationResBuilder b)]) = _$UpdateExpenseLocationRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseLocationResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseLocationRes> get serializer => _$UpdateExpenseLocationResSerializer();
}

class _$UpdateExpenseLocationResSerializer implements PrimitiveSerializer<UpdateExpenseLocationRes> {
  @override
  final Iterable<Type> types = const [UpdateExpenseLocationRes, _$UpdateExpenseLocationRes];

  @override
  final String wireName = r'UpdateExpenseLocationRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseLocationRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedExpenseLocation';
    yield serializers.serialize(
      object.updatedExpenseLocation,
      specifiedType: const FullType(ModelExpenseLocation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseLocationRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseLocationResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedExpenseLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseLocation),
          ) as ModelExpenseLocation;
          result.updatedExpenseLocation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseLocationRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseLocationResBuilder();
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

