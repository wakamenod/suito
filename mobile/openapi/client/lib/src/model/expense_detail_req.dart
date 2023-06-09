//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_detail_req.g.dart';

/// ExpenseDetailReq
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class ExpenseDetailReq implements Built<ExpenseDetailReq, ExpenseDetailReqBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  ExpenseDetailReq._();

  factory ExpenseDetailReq([void updates(ExpenseDetailReqBuilder b)]) = _$ExpenseDetailReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseDetailReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseDetailReq> get serializer => _$ExpenseDetailReqSerializer();
}

class _$ExpenseDetailReqSerializer implements PrimitiveSerializer<ExpenseDetailReq> {
  @override
  final Iterable<Type> types = const [ExpenseDetailReq, _$ExpenseDetailReq];

  @override
  final String wireName = r'ExpenseDetailReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseDetailReq object, {
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
    ExpenseDetailReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseDetailReqBuilder result,
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
  ExpenseDetailReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseDetailReqBuilder();
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

