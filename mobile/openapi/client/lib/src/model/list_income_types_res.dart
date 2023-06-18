//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_income_types_res.g.dart';

/// ListIncomeTypesRes
///
/// Properties:
/// * [incomeTypes] 
@BuiltValue()
abstract class ListIncomeTypesRes implements Built<ListIncomeTypesRes, ListIncomeTypesResBuilder> {
  @BuiltValueField(wireName: r'incomeTypes')
  BuiltList<ModelIncomeType> get incomeTypes;

  ListIncomeTypesRes._();

  factory ListIncomeTypesRes([void updates(ListIncomeTypesResBuilder b)]) = _$ListIncomeTypesRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListIncomeTypesResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListIncomeTypesRes> get serializer => _$ListIncomeTypesResSerializer();
}

class _$ListIncomeTypesResSerializer implements PrimitiveSerializer<ListIncomeTypesRes> {
  @override
  final Iterable<Type> types = const [ListIncomeTypesRes, _$ListIncomeTypesRes];

  @override
  final String wireName = r'ListIncomeTypesRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListIncomeTypesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'incomeTypes';
    yield serializers.serialize(
      object.incomeTypes,
      specifiedType: const FullType(BuiltList, [FullType(ModelIncomeType)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListIncomeTypesRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListIncomeTypesResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'incomeTypes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ModelIncomeType)]),
          ) as BuiltList<ModelIncomeType>;
          result.incomeTypes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListIncomeTypesRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListIncomeTypesResBuilder();
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

