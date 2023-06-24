//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_schedule_res.g.dart';

/// UpdateExpenseScheduleRes
///
/// Properties:
/// * [updatedExpenseSchedule] 
@BuiltValue()
abstract class UpdateExpenseScheduleRes implements Built<UpdateExpenseScheduleRes, UpdateExpenseScheduleResBuilder> {
  @BuiltValueField(wireName: r'updatedExpenseSchedule')
  ModelExpenseSchedule get updatedExpenseSchedule;

  UpdateExpenseScheduleRes._();

  factory UpdateExpenseScheduleRes([void updates(UpdateExpenseScheduleResBuilder b)]) = _$UpdateExpenseScheduleRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseScheduleResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseScheduleRes> get serializer => _$UpdateExpenseScheduleResSerializer();
}

class _$UpdateExpenseScheduleResSerializer implements PrimitiveSerializer<UpdateExpenseScheduleRes> {
  @override
  final Iterable<Type> types = const [UpdateExpenseScheduleRes, _$UpdateExpenseScheduleRes];

  @override
  final String wireName = r'UpdateExpenseScheduleRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedExpenseSchedule';
    yield serializers.serialize(
      object.updatedExpenseSchedule,
      specifiedType: const FullType(ModelExpenseSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseScheduleResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedExpenseSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseSchedule),
          ) as ModelExpenseSchedule;
          result.updatedExpenseSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseScheduleRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseScheduleResBuilder();
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

