//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_res.g.dart';

/// UpdateExpenseRes
///
/// Properties:
/// * [updatedExpense] 
@BuiltValue()
abstract class UpdateExpenseRes implements Built<UpdateExpenseRes, UpdateExpenseResBuilder> {
  @BuiltValueField(wireName: r'updatedExpense')
  ModelExpense get updatedExpense;

  UpdateExpenseRes._();

  factory UpdateExpenseRes([void updates(UpdateExpenseResBuilder b)]) = _$UpdateExpenseRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseRes> get serializer => _$UpdateExpenseResSerializer();
}

class _$UpdateExpenseResSerializer implements PrimitiveSerializer<UpdateExpenseRes> {
  @override
  final Iterable<Type> types = const [UpdateExpenseRes, _$UpdateExpenseRes];

  @override
  final String wireName = r'UpdateExpenseRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedExpense';
    yield serializers.serialize(
      object.updatedExpense,
      specifiedType: const FullType(ModelExpense),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedExpense':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpense),
          ) as ModelExpense;
          result.updatedExpense.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseResBuilder();
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

