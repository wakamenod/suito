//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_income.g.dart';

/// ModelIncome
///
/// Properties:
/// * [amount] 
/// * [id] 
/// * [localDate] 
/// * [memo] 
/// * [title] 
@BuiltValue()
abstract class ModelIncome implements Built<ModelIncome, ModelIncomeBuilder> {
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

  ModelIncome._();

  factory ModelIncome([void updates(ModelIncomeBuilder b)]) = _$ModelIncome;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelIncomeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelIncome> get serializer => _$ModelIncomeSerializer();
}

class _$ModelIncomeSerializer implements PrimitiveSerializer<ModelIncome> {
  @override
  final Iterable<Type> types = const [ModelIncome, _$ModelIncome];

  @override
  final String wireName = r'ModelIncome';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelIncome object, {
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
    ModelIncome object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ModelIncomeBuilder result,
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
  ModelIncome deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelIncomeBuilder();
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

