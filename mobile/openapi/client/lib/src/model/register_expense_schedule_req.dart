//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_schedule_req.g.dart';

/// RegisterExpenseScheduleReq
///
/// Properties:
/// * [expenseSchedule] 
@BuiltValue()
abstract class RegisterExpenseScheduleReq implements Built<RegisterExpenseScheduleReq, RegisterExpenseScheduleReqBuilder> {
  @BuiltValueField(wireName: r'expenseSchedule')
  ModelExpenseSchedule get expenseSchedule;

  RegisterExpenseScheduleReq._();

  factory RegisterExpenseScheduleReq([void updates(RegisterExpenseScheduleReqBuilder b)]) = _$RegisterExpenseScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseScheduleReq> get serializer => _$RegisterExpenseScheduleReqSerializer();
}

class _$RegisterExpenseScheduleReqSerializer implements PrimitiveSerializer<RegisterExpenseScheduleReq> {
  @override
  final Iterable<Type> types = const [RegisterExpenseScheduleReq, _$RegisterExpenseScheduleReq];

  @override
  final String wireName = r'RegisterExpenseScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseScheduleReq object, {
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
    RegisterExpenseScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseScheduleReqBuilder result,
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
  RegisterExpenseScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseScheduleReqBuilder();
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

