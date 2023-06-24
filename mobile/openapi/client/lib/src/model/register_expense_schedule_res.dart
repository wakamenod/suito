//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_schedule_res.g.dart';

/// RegisterExpenseScheduleRes
///
/// Properties:
/// * [newExpenseSchedule] 
@BuiltValue()
abstract class RegisterExpenseScheduleRes implements Built<RegisterExpenseScheduleRes, RegisterExpenseScheduleResBuilder> {
  @BuiltValueField(wireName: r'newExpenseSchedule')
  ModelExpenseSchedule get newExpenseSchedule;

  RegisterExpenseScheduleRes._();

  factory RegisterExpenseScheduleRes([void updates(RegisterExpenseScheduleResBuilder b)]) = _$RegisterExpenseScheduleRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseScheduleResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseScheduleRes> get serializer => _$RegisterExpenseScheduleResSerializer();
}

class _$RegisterExpenseScheduleResSerializer implements PrimitiveSerializer<RegisterExpenseScheduleRes> {
  @override
  final Iterable<Type> types = const [RegisterExpenseScheduleRes, _$RegisterExpenseScheduleRes];

  @override
  final String wireName = r'RegisterExpenseScheduleRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newExpenseSchedule';
    yield serializers.serialize(
      object.newExpenseSchedule,
      specifiedType: const FullType(ModelExpenseSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterExpenseScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseScheduleResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newExpenseSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseSchedule),
          ) as ModelExpenseSchedule;
          result.newExpenseSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterExpenseScheduleRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseScheduleResBuilder();
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

