//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_expense_location_req.g.dart';

/// DeleteExpenseLocationReq
///
/// Properties:
/// * [expenseLocationId] 
@BuiltValue()
abstract class DeleteExpenseLocationReq implements Built<DeleteExpenseLocationReq, DeleteExpenseLocationReqBuilder> {
  @BuiltValueField(wireName: r'expenseLocationId')
  String get expenseLocationId;

  DeleteExpenseLocationReq._();

  factory DeleteExpenseLocationReq([void updates(DeleteExpenseLocationReqBuilder b)]) = _$DeleteExpenseLocationReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteExpenseLocationReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteExpenseLocationReq> get serializer => _$DeleteExpenseLocationReqSerializer();
}

class _$DeleteExpenseLocationReqSerializer implements PrimitiveSerializer<DeleteExpenseLocationReq> {
  @override
  final Iterable<Type> types = const [DeleteExpenseLocationReq, _$DeleteExpenseLocationReq];

  @override
  final String wireName = r'DeleteExpenseLocationReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteExpenseLocationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseLocationId';
    yield serializers.serialize(
      object.expenseLocationId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteExpenseLocationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteExpenseLocationReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseLocationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expenseLocationId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteExpenseLocationReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteExpenseLocationReqBuilder();
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

