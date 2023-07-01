//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_category_res.g.dart';

/// UpdateExpenseCategoryRes
///
/// Properties:
/// * [updatedExpenseCategory] 
@BuiltValue()
abstract class UpdateExpenseCategoryRes implements Built<UpdateExpenseCategoryRes, UpdateExpenseCategoryResBuilder> {
  @BuiltValueField(wireName: r'updatedExpenseCategory')
  ModelExpenseCategory get updatedExpenseCategory;

  UpdateExpenseCategoryRes._();

  factory UpdateExpenseCategoryRes([void updates(UpdateExpenseCategoryResBuilder b)]) = _$UpdateExpenseCategoryRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseCategoryResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseCategoryRes> get serializer => _$UpdateExpenseCategoryResSerializer();
}

class _$UpdateExpenseCategoryResSerializer implements PrimitiveSerializer<UpdateExpenseCategoryRes> {
  @override
  final Iterable<Type> types = const [UpdateExpenseCategoryRes, _$UpdateExpenseCategoryRes];

  @override
  final String wireName = r'UpdateExpenseCategoryRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseCategoryRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedExpenseCategory';
    yield serializers.serialize(
      object.updatedExpenseCategory,
      specifiedType: const FullType(ModelExpenseCategory),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseCategoryRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseCategoryResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedExpenseCategory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseCategory),
          ) as ModelExpenseCategory;
          result.updatedExpenseCategory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseCategoryRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseCategoryResBuilder();
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

