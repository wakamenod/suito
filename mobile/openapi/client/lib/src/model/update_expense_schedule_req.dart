//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_schedule_req.g.dart';

/// UpdateExpenseScheduleReq
///
/// Properties:
/// * [expenseSchedule] 
@BuiltValue()
abstract class UpdateExpenseScheduleReq implements Built<UpdateExpenseScheduleReq, UpdateExpenseScheduleReqBuilder> {
  @BuiltValueField(wireName: r'expenseSchedule')
  ModelExpenseSchedule get expenseSchedule;

  UpdateExpenseScheduleReq._();

  factory UpdateExpenseScheduleReq([void updates(UpdateExpenseScheduleReqBuilder b)]) = _$UpdateExpenseScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseScheduleReq> get serializer => _$UpdateExpenseScheduleReqSerializer();
}

class _$UpdateExpenseScheduleReqSerializer implements PrimitiveSerializer<UpdateExpenseScheduleReq> {
  @override
  final Iterable<Type> types = const [UpdateExpenseScheduleReq, _$UpdateExpenseScheduleReq];

  @override
  final String wireName = r'UpdateExpenseScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseSchedule';
    yield serializers.serialize(
      object.expenseSchedule,
      specifiedType: const FullType(ModelExpenseSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseScheduleReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseSchedule),
          ) as ModelExpenseSchedule;
          result.expenseSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseScheduleReqBuilder();
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

