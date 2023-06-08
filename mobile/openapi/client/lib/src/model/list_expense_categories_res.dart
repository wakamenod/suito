//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_expense_categories_res.g.dart';

/// ListExpenseCategoriesRes
///
/// Properties:
/// * [expenseCategories] 
@BuiltValue()
abstract class ListExpenseCategoriesRes implements Built<ListExpenseCategoriesRes, ListExpenseCategoriesResBuilder> {
  @BuiltValueField(wireName: r'expenseCategories')
  BuiltList<ModelExpenseCategory> get expenseCategories;

  ListExpenseCategoriesRes._();

  factory ListExpenseCategoriesRes([void updates(ListExpenseCategoriesResBuilder b)]) = _$ListExpenseCategoriesRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListExpenseCategoriesResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListExpenseCategoriesRes> get serializer => _$ListExpenseCategoriesResSerializer();
}

class _$ListExpenseCategoriesResSerializer implements PrimitiveSerializer<ListExpenseCategoriesRes> {
  @override
  final Iterable<Type> types = const [ListExpenseCategoriesRes, _$ListExpenseCategoriesRes];

  @override
  final String wireName = r'ListExpenseCategoriesRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListExpenseCategoriesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseCategories';
    yield serializers.serialize(
      object.expenseCategories,
      specifiedType: const FullType(BuiltList, [FullType(ModelExpenseCategory)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListExpenseCategoriesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListExpenseCategoriesResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseCategories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ModelExpenseCategory)]),
          ) as BuiltList<ModelExpenseCategory>;
          result.expenseCategories.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListExpenseCategoriesRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListExpenseCategoriesResBuilder();
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

