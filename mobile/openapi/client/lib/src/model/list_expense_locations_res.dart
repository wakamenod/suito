//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_expense_locations_res.g.dart';

/// ListExpenseLocationsRes
///
/// Properties:
/// * [expenseLocations] 
@BuiltValue()
abstract class ListExpenseLocationsRes implements Built<ListExpenseLocationsRes, ListExpenseLocationsResBuilder> {
  @BuiltValueField(wireName: r'expenseLocations')
  BuiltList<ModelExpenseLocation> get expenseLocations;

  ListExpenseLocationsRes._();

  factory ListExpenseLocationsRes([void updates(ListExpenseLocationsResBuilder b)]) = _$ListExpenseLocationsRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListExpenseLocationsResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListExpenseLocationsRes> get serializer => _$ListExpenseLocationsResSerializer();
}

class _$ListExpenseLocationsResSerializer implements PrimitiveSerializer<ListExpenseLocationsRes> {
  @override
  final Iterable<Type> types = const [ListExpenseLocationsRes, _$ListExpenseLocationsRes];

  @override
  final String wireName = r'ListExpenseLocationsRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListExpenseLocationsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseLocations';
    yield serializers.serialize(
      object.expenseLocations,
      specifiedType: const FullType(BuiltList, [FullType(ModelExpenseLocation)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListExpenseLocationsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListExpenseLocationsResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseLocations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ModelExpenseLocation)]),
          ) as BuiltList<ModelExpenseLocation>;
          result.expenseLocations.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListExpenseLocationsRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListExpenseLocationsResBuilder();
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

