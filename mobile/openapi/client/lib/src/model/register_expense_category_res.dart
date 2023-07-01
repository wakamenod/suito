//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_category_res.g.dart';

/// RegisterExpenseCategoryRes
///
/// Properties:
/// * [newExpenseCategory] 
@BuiltValue()
abstract class RegisterExpenseCategoryRes implements Built<RegisterExpenseCategoryRes, RegisterExpenseCategoryResBuilder> {
  @BuiltValueField(wireName: r'newExpenseCategory')
  ModelExpenseCategory get newExpenseCategory;

  RegisterExpenseCategoryRes._();

  factory RegisterExpenseCategoryRes([void updates(RegisterExpenseCategoryResBuilder b)]) = _$RegisterExpenseCategoryRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseCategoryResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseCategoryRes> get serializer => _$RegisterExpenseCategoryResSerializer();
}

class _$RegisterExpenseCategoryResSerializer implements PrimitiveSerializer<RegisterExpenseCategoryRes> {
  @override
  final Iterable<Type> types = const [RegisterExpenseCategoryRes, _$RegisterExpenseCategoryRes];

  @override
  final String wireName = r'RegisterExpenseCategoryRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseCategoryRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newExpenseCategory';
    yield serializers.serialize(
      object.newExpenseCategory,
      specifiedType: const FullType(ModelExpenseCategory),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterExpenseCategoryRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseCategoryResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newExpenseCategory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseCategory),
          ) as ModelExpenseCategory;
          result.newExpenseCategory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterExpenseCategoryRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseCategoryResBuilder();
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

