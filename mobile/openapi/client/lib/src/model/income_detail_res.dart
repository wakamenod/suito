//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'income_detail_res.g.dart';

/// IncomeDetailRes
///
/// Properties:
/// * [income] 
@BuiltValue()
abstract class IncomeDetailRes implements Built<IncomeDetailRes, IncomeDetailResBuilder> {
  @BuiltValueField(wireName: r'income')
  ModelIncome get income;

  IncomeDetailRes._();

  factory IncomeDetailRes([void updates(IncomeDetailResBuilder b)]) = _$IncomeDetailRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IncomeDetailResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IncomeDetailRes> get serializer => _$IncomeDetailResSerializer();
}

class _$IncomeDetailResSerializer implements PrimitiveSerializer<IncomeDetailRes> {
  @override
  final Iterable<Type> types = const [IncomeDetailRes, _$IncomeDetailRes];

  @override
  final String wireName = r'IncomeDetailRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IncomeDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'income';
    yield serializers.serialize(
      object.income,
      specifiedType: const FullType(ModelIncome),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IncomeDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IncomeDetailResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'income':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncome),
          ) as ModelIncome;
          result.income.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IncomeDetailRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IncomeDetailResBuilder();
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

