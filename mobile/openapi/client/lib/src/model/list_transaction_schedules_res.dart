//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/transaction_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_transaction_schedules_res.g.dart';

/// ListTransactionSchedulesRes
///
/// Properties:
/// * [expenseSchedules] 
/// * [incomeSchedules] 
@BuiltValue()
abstract class ListTransactionSchedulesRes implements Built<ListTransactionSchedulesRes, ListTransactionSchedulesResBuilder> {
  @BuiltValueField(wireName: r'expenseSchedules')
  BuiltList<TransactionSchedule> get expenseSchedules;

  @BuiltValueField(wireName: r'incomeSchedules')
  BuiltList<TransactionSchedule> get incomeSchedules;

  ListTransactionSchedulesRes._();

  factory ListTransactionSchedulesRes([void updates(ListTransactionSchedulesResBuilder b)]) = _$ListTransactionSchedulesRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListTransactionSchedulesResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListTransactionSchedulesRes> get serializer => _$ListTransactionSchedulesResSerializer();
}

class _$ListTransactionSchedulesResSerializer implements PrimitiveSerializer<ListTransactionSchedulesRes> {
  @override
  final Iterable<Type> types = const [ListTransactionSchedulesRes, _$ListTransactionSchedulesRes];

  @override
  final String wireName = r'ListTransactionSchedulesRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListTransactionSchedulesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseSchedules';
    yield serializers.serialize(
      object.expenseSchedules,
      specifiedType: const FullType(BuiltList, [FullType(TransactionSchedule)]),
    );
    yield r'incomeSchedules';
    yield serializers.serialize(
      object.incomeSchedules,
      specifiedType: const FullType(BuiltList, [FullType(TransactionSchedule)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListTransactionSchedulesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListTransactionSchedulesResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseSchedules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TransactionSchedule)]),
          ) as BuiltList<TransactionSchedule>;
          result.expenseSchedules.replace(valueDes);
          break;
        case r'incomeSchedules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TransactionSchedule)]),
          ) as BuiltList<TransactionSchedule>;
          result.incomeSchedules.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListTransactionSchedulesRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListTransactionSchedulesResBuilder();
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

