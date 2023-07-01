//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_category_req.g.dart';

/// UpdateExpenseCategoryReq
///
/// Properties:
/// * [expenseCategory] 
@BuiltValue()
abstract class UpdateExpenseCategoryReq implements Built<UpdateExpenseCategoryReq, UpdateExpenseCategoryReqBuilder> {
  @BuiltValueField(wireName: r'expenseCategory')
  ModelExpenseCategory get expenseCategory;

  UpdateExpenseCategoryReq._();

  factory UpdateExpenseCategoryReq([void updates(UpdateExpenseCategoryReqBuilder b)]) = _$UpdateExpenseCategoryReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseCategoryReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseCategoryReq> get serializer => _$UpdateExpenseCategoryReqSerializer();
}

class _$UpdateExpenseCategoryReqSerializer implements PrimitiveSerializer<UpdateExpenseCategoryReq> {
  @override
  final Iterable<Type> types = const [UpdateExpenseCategoryReq, _$UpdateExpenseCategoryReq];

  @override
  final String wireName = r'UpdateExpenseCategoryReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseCategory';
    yield serializers.serialize(
      object.expenseCategory,
      specifiedType: const FullType(ModelExpenseCategory),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseCategoryReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseCategory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseCategory),
          ) as ModelExpenseCategory;
          result.expenseCategory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseCategoryReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseCategoryReqBuilder();
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

