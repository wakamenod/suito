//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/gorm_deleted_at.dart';
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_income_schedule.g.dart';

/// ModelIncomeSchedule
///
/// Properties:
/// * [amount] 
/// * [createdAt] 
/// * [deletedAt] 
/// * [id] 
/// * [incomeType] 
/// * [memo] 
/// * [scheduleType] 
/// * [timezone] 
/// * [updatedAt] 
@BuiltValue()
abstract class ModelIncomeSchedule implements Built<ModelIncomeSchedule, ModelIncomeScheduleBuilder> {
  @BuiltValueField(wireName: r'amount')
  int get amount;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'deletedAt')
  GormDeletedAt? get deletedAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'incomeType')
  ModelIncomeType get incomeType;

  @BuiltValueField(wireName: r'memo')
  String get memo;

  @BuiltValueField(wireName: r'scheduleType')
  int? get scheduleType;

  @BuiltValueField(wireName: r'timezone')
  String get timezone;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  ModelIncomeSchedule._();

  factory ModelIncomeSchedule([void updates(ModelIncomeScheduleBuilder b)]) = _$ModelIncomeSchedule;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelIncomeScheduleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelIncomeSchedule> get serializer => _$ModelIncomeScheduleSerializer();
}

class _$ModelIncomeScheduleSerializer implements PrimitiveSerializer<ModelIncomeSchedule> {
  @override
  final Iterable<Type> types = const [ModelIncomeSchedule, _$ModelIncomeSchedule];

  @override
  final String wireName = r'ModelIncomeSchedule';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelIncomeSchedule object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(int),
    );
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(String),
      );
    }
    if (object.deletedAt != null) {
      yield r'deletedAt';
      yield serializers.serialize(
        object.deletedAt,
        specifiedType: const FullType(GormDeletedAt),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'incomeType';
    yield serializers.serialize(
      object.incomeType,
      specifiedType: const FullType(ModelIncomeType),
    );
    yield r'memo';
    yield serializers.serialize(
      object.memo,
      specifiedType: const FullType(String),
    );
    if (object.scheduleType != null) {
      yield r'scheduleType';
      yield serializers.serialize(
        object.scheduleType,
        specifiedType: const FullType(int),
      );
    }
    yield r'timezone';
    yield serializers.serialize(
      object.timezone,
      specifiedType: const FullType(String),
    );
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ModelIncomeSchedule object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ModelIncomeScheduleBuilder result,
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
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'deletedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GormDeletedAt),
          ) as GormDeletedAt;
          result.deletedAt.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'incomeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeType),
          ) as ModelIncomeType;
          result.incomeType.replace(valueDes);
          break;
        case r'memo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.memo = valueDes;
          break;
        case r'scheduleType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.scheduleType = valueDes;
          break;
        case r'timezone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.timezone = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ModelIncomeSchedule deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelIncomeScheduleBuilder();
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

