//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'income_schedule_detail_res.g.dart';

/// IncomeScheduleDetailRes
///
/// Properties:
/// * [incomeShcedule] 
@BuiltValue()
abstract class IncomeScheduleDetailRes implements Built<IncomeScheduleDetailRes, IncomeScheduleDetailResBuilder> {
  @BuiltValueField(wireName: r'incomeShcedule')
  ModelIncomeSchedule get incomeShcedule;

  IncomeScheduleDetailRes._();

  factory IncomeScheduleDetailRes([void updates(IncomeScheduleDetailResBuilder b)]) = _$IncomeScheduleDetailRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IncomeScheduleDetailResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IncomeScheduleDetailRes> get serializer => _$IncomeScheduleDetailResSerializer();
}

class _$IncomeScheduleDetailResSerializer implements PrimitiveSerializer<IncomeScheduleDetailRes> {
  @override
  final Iterable<Type> types = const [IncomeScheduleDetailRes, _$IncomeScheduleDetailRes];

  @override
  final String wireName = r'IncomeScheduleDetailRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IncomeScheduleDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'incomeShcedule';
    yield serializers.serialize(
      object.incomeShcedule,
      specifiedType: const FullType(ModelIncomeSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IncomeScheduleDetailRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IncomeScheduleDetailResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'incomeShcedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeSchedule),
          ) as ModelIncomeSchedule;
          result.incomeShcedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IncomeScheduleDetailRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IncomeScheduleDetailResBuilder();
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

