//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_expense.g.dart';

/// ModelExpense
///
/// Properties:
/// * [amount] 
/// * [id] 
/// * [localDate] 
/// * [memo] 
/// * [title] 
@BuiltValue()
abstract class ModelExpense implements Built<ModelExpense, ModelExpenseBuilder> {
  @BuiltValueField(wireName: r'amount')
  int get amount;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'local_date')
  String get localDate;

  @BuiltValueField(wireName: r'memo')
  String get memo;

  @BuiltValueField(wireName: r'title')
  String get title;

  ModelExpense._();

  factory ModelExpense([void updates(ModelExpenseBuilder b)]) = _$ModelExpense;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelExpenseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelExpense> get serializer => _$ModelExpenseSerializer();
}

class _$ModelExpenseSerializer implements PrimitiveSerializer<ModelExpense> {
  @override
  final Iterable<Type> types = const [ModelExpense, _$ModelExpense];

  @override
  final String wireName = r'ModelExpense';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelExpense object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(int),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'local_date';
    yield serializers.serialize(
      object.localDate,
      specifiedType: const FullType(String),
    );
    yield r'memo';
    yield serializers.serialize(
      object.memo,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ModelExpense object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ModelExpenseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amount = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'local_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.localDate = valueDes;
          break;
        case r'memo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.memo = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ModelExpense deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelExpenseBuilder();
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

