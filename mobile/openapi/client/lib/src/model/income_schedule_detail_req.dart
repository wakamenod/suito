//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'income_schedule_detail_req.g.dart';

/// IncomeScheduleDetailReq
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class IncomeScheduleDetailReq implements Built<IncomeScheduleDetailReq, IncomeScheduleDetailReqBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  IncomeScheduleDetailReq._();

  factory IncomeScheduleDetailReq([void updates(IncomeScheduleDetailReqBuilder b)]) = _$IncomeScheduleDetailReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IncomeScheduleDetailReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IncomeScheduleDetailReq> get serializer => _$IncomeScheduleDetailReqSerializer();
}

class _$IncomeScheduleDetailReqSerializer implements PrimitiveSerializer<IncomeScheduleDetailReq> {
  @override
  final Iterable<Type> types = const [IncomeScheduleDetailReq, _$IncomeScheduleDetailReq];

  @override
  final String wireName = r'IncomeScheduleDetailReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IncomeScheduleDetailReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IncomeScheduleDetailReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IncomeScheduleDetailReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IncomeScheduleDetailReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IncomeScheduleDetailReqBuilder();
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

