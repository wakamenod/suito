//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_res.g.dart';

/// RegisterExpenseRes
///
/// Properties:
/// * [newExpense] 
@BuiltValue()
abstract class RegisterExpenseRes implements Built<RegisterExpenseRes, RegisterExpenseResBuilder> {
  @BuiltValueField(wireName: r'newExpense')
  ModelExpense get newExpense;

  RegisterExpenseRes._();

  factory RegisterExpenseRes([void updates(RegisterExpenseResBuilder b)]) = _$RegisterExpenseRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseRes> get serializer => _$RegisterExpenseResSerializer();
}

class _$RegisterExpenseResSerializer implements PrimitiveSerializer<RegisterExpenseRes> {
  @override
  final Iterable<Type> types = const [RegisterExpenseRes, _$RegisterExpenseRes];

  @override
  final String wireName = r'RegisterExpenseRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newExpense';
    yield serializers.serialize(
      object.newExpense,
      specifiedType: const FullType(ModelExpense),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterExpenseRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newExpense':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpense),
          ) as ModelExpense;
          result.newExpense.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterExpenseRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseResBuilder();
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

