//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_expense_category_req.g.dart';

/// DeleteExpenseCategoryReq
///
/// Properties:
/// * [expenseCategoryId] 
@BuiltValue()
abstract class DeleteExpenseCategoryReq implements Built<DeleteExpenseCategoryReq, DeleteExpenseCategoryReqBuilder> {
  @BuiltValueField(wireName: r'expenseCategoryId')
  String get expenseCategoryId;

  DeleteExpenseCategoryReq._();

  factory DeleteExpenseCategoryReq([void updates(DeleteExpenseCategoryReqBuilder b)]) = _$DeleteExpenseCategoryReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteExpenseCategoryReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteExpenseCategoryReq> get serializer => _$DeleteExpenseCategoryReqSerializer();
}

class _$DeleteExpenseCategoryReqSerializer implements PrimitiveSerializer<DeleteExpenseCategoryReq> {
  @override
  final Iterable<Type> types = const [DeleteExpenseCategoryReq, _$DeleteExpenseCategoryReq];

  @override
  final String wireName = r'DeleteExpenseCategoryReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteExpenseCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseCategoryId';
    yield serializers.serialize(
      object.expenseCategoryId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteExpenseCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteExpenseCategoryReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseCategoryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expenseCategoryId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteExpenseCategoryReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteExpenseCategoryReqBuilder();
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

