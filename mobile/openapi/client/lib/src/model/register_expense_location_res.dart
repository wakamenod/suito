//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_location_res.g.dart';

/// RegisterExpenseLocationRes
///
/// Properties:
/// * [newExpenseLocation] 
@BuiltValue()
abstract class RegisterExpenseLocationRes implements Built<RegisterExpenseLocationRes, RegisterExpenseLocationResBuilder> {
  @BuiltValueField(wireName: r'newExpenseLocation')
  ModelExpenseLocation get newExpenseLocation;

  RegisterExpenseLocationRes._();

  factory RegisterExpenseLocationRes([void updates(RegisterExpenseLocationResBuilder b)]) = _$RegisterExpenseLocationRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseLocationResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseLocationRes> get serializer => _$RegisterExpenseLocationResSerializer();
}

class _$RegisterExpenseLocationResSerializer implements PrimitiveSerializer<RegisterExpenseLocationRes> {
  @override
  final Iterable<Type> types = const [RegisterExpenseLocationRes, _$RegisterExpenseLocationRes];

  @override
  final String wireName = r'RegisterExpenseLocationRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseLocationRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newExpenseLocation';
    yield serializers.serialize(
      object.newExpenseLocation,
      specifiedType: const FullType(ModelExpenseLocation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterExpenseLocationRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseLocationResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newExpenseLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseLocation),
          ) as ModelExpenseLocation;
          result.newExpenseLocation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterExpenseLocationRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseLocationResBuilder();
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

