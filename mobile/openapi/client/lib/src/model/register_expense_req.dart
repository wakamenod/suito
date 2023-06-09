//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_req.g.dart';

/// RegisterExpenseReq
///
/// Properties:
/// * [expense] 
@BuiltValue()
abstract class RegisterExpenseReq implements Built<RegisterExpenseReq, RegisterExpenseReqBuilder> {
  @BuiltValueField(wireName: r'expense')
  ModelExpense get expense;

  RegisterExpenseReq._();

  factory RegisterExpenseReq([void updates(RegisterExpenseReqBuilder b)]) = _$RegisterExpenseReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseReq> get serializer => _$RegisterExpenseReqSerializer();
}

class _$RegisterExpenseReqSerializer implements PrimitiveSerializer<RegisterExpenseReq> {
  @override
  final Iterable<Type> types = const [RegisterExpenseReq, _$RegisterExpenseReq];

  @override
  final String wireName = r'RegisterExpenseReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expense';
    yield serializers.serialize(
      object.expense,
      specifiedType: const FullType(ModelExpense),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterExpenseReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expense':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpense),
          ) as ModelExpense;
          result.expense.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterExpenseReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseReqBuilder();
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

