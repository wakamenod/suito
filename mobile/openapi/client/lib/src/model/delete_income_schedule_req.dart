//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_income_schedule_req.g.dart';

/// DeleteIncomeScheduleReq
///
/// Properties:
/// * [incomeScheduleId] 
@BuiltValue()
abstract class DeleteIncomeScheduleReq implements Built<DeleteIncomeScheduleReq, DeleteIncomeScheduleReqBuilder> {
  @BuiltValueField(wireName: r'incomeScheduleId')
  String get incomeScheduleId;

  DeleteIncomeScheduleReq._();

  factory DeleteIncomeScheduleReq([void updates(DeleteIncomeScheduleReqBuilder b)]) = _$DeleteIncomeScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteIncomeScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteIncomeScheduleReq> get serializer => _$DeleteIncomeScheduleReqSerializer();
}

class _$DeleteIncomeScheduleReqSerializer implements PrimitiveSerializer<DeleteIncomeScheduleReq> {
  @override
  final Iterable<Type> types = const [DeleteIncomeScheduleReq, _$DeleteIncomeScheduleReq];

  @override
  final String wireName = r'DeleteIncomeScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteIncomeScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'incomeScheduleId';
    yield serializers.serialize(
      object.incomeScheduleId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteIncomeScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteIncomeScheduleReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'incomeScheduleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.incomeScheduleId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteIncomeScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteIncomeScheduleReqBuilder();
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

