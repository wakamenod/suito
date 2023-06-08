//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_res.g.dart';

/// RegisterIncomeRes
///
/// Properties:
/// * [newIncome] 
@BuiltValue()
abstract class RegisterIncomeRes implements Built<RegisterIncomeRes, RegisterIncomeResBuilder> {
  @BuiltValueField(wireName: r'newIncome')
  ModelIncome get newIncome;

  RegisterIncomeRes._();

  factory RegisterIncomeRes([void updates(RegisterIncomeResBuilder b)]) = _$RegisterIncomeRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeRes> get serializer => _$RegisterIncomeResSerializer();
}

class _$RegisterIncomeResSerializer implements PrimitiveSerializer<RegisterIncomeRes> {
  @override
  final Iterable<Type> types = const [RegisterIncomeRes, _$RegisterIncomeRes];

  @override
  final String wireName = r'RegisterIncomeRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newIncome';
    yield serializers.serialize(
      object.newIncome,
      specifiedType: const FullType(ModelIncome),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterIncomeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newIncome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncome),
          ) as ModelIncome;
          result.newIncome.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterIncomeRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeResBuilder();
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

