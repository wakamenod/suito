//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_detail_res.g.dart';

/// ExpenseDetailRes
///
/// Properties:
/// * [expense] 
@BuiltValue()
abstract class ExpenseDetailRes implements Built<ExpenseDetailRes, ExpenseDetailResBuilder> {
  @BuiltValueField(wireName: r'expense')
  ModelExpense get expense;

  ExpenseDetailRes._();

  factory ExpenseDetailRes([void updates(ExpenseDetailResBuilder b)]) = _$ExpenseDetailRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseDetailResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseDetailRes> get serializer => _$ExpenseDetailResSerializer();
}

class _$ExpenseDetailResSerializer implements PrimitiveSerializer<ExpenseDetailRes> {
  @override
  final Iterable<Type> types = const [ExpenseDetailRes, _$ExpenseDetailRes];

  @override
  final String wireName = r'ExpenseDetailRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseDetailRes object, {
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
    ExpenseDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseDetailResBuilder result,
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
  ExpenseDetailRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseDetailResBuilder();
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

