//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_expense_schedule_req.g.dart';

/// DeleteExpenseScheduleReq
///
/// Properties:
/// * [expenseScheduleId] 
@BuiltValue()
abstract class DeleteExpenseScheduleReq implements Built<DeleteExpenseScheduleReq, DeleteExpenseScheduleReqBuilder> {
  @BuiltValueField(wireName: r'expenseScheduleId')
  String get expenseScheduleId;

  DeleteExpenseScheduleReq._();

  factory DeleteExpenseScheduleReq([void updates(DeleteExpenseScheduleReqBuilder b)]) = _$DeleteExpenseScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteExpenseScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteExpenseScheduleReq> get serializer => _$DeleteExpenseScheduleReqSerializer();
}

class _$DeleteExpenseScheduleReqSerializer implements PrimitiveSerializer<DeleteExpenseScheduleReq> {
  @override
  final Iterable<Type> types = const [DeleteExpenseScheduleReq, _$DeleteExpenseScheduleReq];

  @override
  final String wireName = r'DeleteExpenseScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteExpenseScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseScheduleId';
    yield serializers.serialize(
      object.expenseScheduleId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteExpenseScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteExpenseScheduleReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseScheduleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expenseScheduleId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteExpenseScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteExpenseScheduleReqBuilder();
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

