//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_income_type_req.g.dart';

/// DeleteIncomeTypeReq
///
/// Properties:
/// * [incomeTypeId] 
@BuiltValue()
abstract class DeleteIncomeTypeReq implements Built<DeleteIncomeTypeReq, DeleteIncomeTypeReqBuilder> {
  @BuiltValueField(wireName: r'IncomeTypeId')
  String get incomeTypeId;

  DeleteIncomeTypeReq._();

  factory DeleteIncomeTypeReq([void updates(DeleteIncomeTypeReqBuilder b)]) = _$DeleteIncomeTypeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteIncomeTypeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteIncomeTypeReq> get serializer => _$DeleteIncomeTypeReqSerializer();
}

class _$DeleteIncomeTypeReqSerializer implements PrimitiveSerializer<DeleteIncomeTypeReq> {
  @override
  final Iterable<Type> types = const [DeleteIncomeTypeReq, _$DeleteIncomeTypeReq];

  @override
  final String wireName = r'DeleteIncomeTypeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteIncomeTypeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'IncomeTypeId';
    yield serializers.serialize(
      object.incomeTypeId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteIncomeTypeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteIncomeTypeReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'IncomeTypeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.incomeTypeId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteIncomeTypeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteIncomeTypeReqBuilder();
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

