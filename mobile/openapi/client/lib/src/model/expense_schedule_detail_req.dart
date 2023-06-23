//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_schedule_detail_req.g.dart';

/// ExpenseScheduleDetailReq
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class ExpenseScheduleDetailReq implements Built<ExpenseScheduleDetailReq, ExpenseScheduleDetailReqBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  ExpenseScheduleDetailReq._();

  factory ExpenseScheduleDetailReq([void updates(ExpenseScheduleDetailReqBuilder b)]) = _$ExpenseScheduleDetailReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseScheduleDetailReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseScheduleDetailReq> get serializer => _$ExpenseScheduleDetailReqSerializer();
}

class _$ExpenseScheduleDetailReqSerializer implements PrimitiveSerializer<ExpenseScheduleDetailReq> {
  @override
  final Iterable<Type> types = const [ExpenseScheduleDetailReq, _$ExpenseScheduleDetailReq];

  @override
  final String wireName = r'ExpenseScheduleDetailReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseScheduleDetailReq object, {
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
    ExpenseScheduleDetailReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseScheduleDetailReqBuilder result,
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
  ExpenseScheduleDetailReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseScheduleDetailReqBuilder();
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

