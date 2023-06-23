//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_schedule_detail_res.g.dart';

/// ExpenseScheduleDetailRes
///
/// Properties:
/// * [expenseShcedule] 
@BuiltValue()
abstract class ExpenseScheduleDetailRes implements Built<ExpenseScheduleDetailRes, ExpenseScheduleDetailResBuilder> {
  @BuiltValueField(wireName: r'expenseShcedule')
  ModelExpenseSchedule get expenseShcedule;

  ExpenseScheduleDetailRes._();

  factory ExpenseScheduleDetailRes([void updates(ExpenseScheduleDetailResBuilder b)]) = _$ExpenseScheduleDetailRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseScheduleDetailResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseScheduleDetailRes> get serializer => _$ExpenseScheduleDetailResSerializer();
}

class _$ExpenseScheduleDetailResSerializer implements PrimitiveSerializer<ExpenseScheduleDetailRes> {
  @override
  final Iterable<Type> types = const [ExpenseScheduleDetailRes, _$ExpenseScheduleDetailRes];

  @override
  final String wireName = r'ExpenseScheduleDetailRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseScheduleDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseShcedule';
    yield serializers.serialize(
      object.expenseShcedule,
      specifiedType: const FullType(ModelExpenseSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseScheduleDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseScheduleDetailResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseShcedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseSchedule),
          ) as ModelExpenseSchedule;
          result.expenseShcedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseScheduleDetailRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseScheduleDetailResBuilder();
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

