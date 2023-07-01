//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'github_com_wakamenod_suito_api_controllers_update_expense_category_res.g.dart';

/// GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes
///
/// Properties:
/// * [updatedExpenseCategory] 
@BuiltValue()
abstract class GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes implements Built<GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes, GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder> {
  @BuiltValueField(wireName: r'updatedExpenseCategory')
  ModelExpenseCategory get updatedExpenseCategory;

  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes._();

  factory GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes([void updates(GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder b)]) = _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes> get serializer => _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResSerializer();
}

class _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResSerializer implements PrimitiveSerializer<GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes> {
  @override
  final Iterable<Type> types = const [GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes, _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes];

  @override
  final String wireName = r'GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes object, {
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
    GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder result,
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
  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder();
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

