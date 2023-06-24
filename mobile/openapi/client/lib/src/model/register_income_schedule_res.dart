//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_schedule_res.g.dart';

/// RegisterIncomeScheduleRes
///
/// Properties:
/// * [newIncomeSchedule] 
@BuiltValue()
abstract class RegisterIncomeScheduleRes implements Built<RegisterIncomeScheduleRes, RegisterIncomeScheduleResBuilder> {
  @BuiltValueField(wireName: r'newIncomeSchedule')
  ModelIncomeSchedule get newIncomeSchedule;

  RegisterIncomeScheduleRes._();

  factory RegisterIncomeScheduleRes([void updates(RegisterIncomeScheduleResBuilder b)]) = _$RegisterIncomeScheduleRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeScheduleResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeScheduleRes> get serializer => _$RegisterIncomeScheduleResSerializer();
}

class _$RegisterIncomeScheduleResSerializer implements PrimitiveSerializer<RegisterIncomeScheduleRes> {
  @override
  final Iterable<Type> types = const [RegisterIncomeScheduleRes, _$RegisterIncomeScheduleRes];

  @override
  final String wireName = r'RegisterIncomeScheduleRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newIncomeSchedule';
    yield serializers.serialize(
      object.newIncomeSchedule,
      specifiedType: const FullType(ModelIncomeSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterIncomeScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeScheduleResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newIncomeSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeSchedule),
          ) as ModelIncomeSchedule;
          result.newIncomeSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterIncomeScheduleRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeScheduleResBuilder();
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

