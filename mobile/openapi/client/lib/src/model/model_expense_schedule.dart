//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:openapi/src/model/gorm_deleted_at.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'model_expense_schedule.g.dart';

/// ModelExpenseSchedule
///
/// Properties:
/// * [amount] 
/// * [createdAt] 
/// * [deletedAt] 
/// * [expenseCategory] 
/// * [expenseLocation] 
/// * [id] 
/// * [memo] 
/// * [scheduleType] 
/// * [title] 
/// * [updatedAt] 
@BuiltValue()
abstract class ModelExpenseSchedule implements Built<ModelExpenseSchedule, ModelExpenseScheduleBuilder> {
  @BuiltValueField(wireName: r'amount')
  int get amount;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'deletedAt')
  GormDeletedAt? get deletedAt;

  @BuiltValueField(wireName: r'expenseCategory')
  ModelExpenseCategory get expenseCategory;

  @BuiltValueField(wireName: r'expenseLocation')
  ModelExpenseLocation get expenseLocation;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'memo')
  String get memo;

  @BuiltValueField(wireName: r'scheduleType')
  int? get scheduleType;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  ModelExpenseSchedule._();

  factory ModelExpenseSchedule([void updates(ModelExpenseScheduleBuilder b)]) = _$ModelExpenseSchedule;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelExpenseScheduleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelExpenseSchedule> get serializer => _$ModelExpenseScheduleSerializer();
}

class _$ModelExpenseScheduleSerializer implements PrimitiveSerializer<ModelExpenseSchedule> {
  @override
  final Iterable<Type> types = const [ModelExpenseSchedule, _$ModelExpenseSchedule];

  @override
  final String wireName = r'ModelExpenseSchedule';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelExpenseSchedule object, {
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
    yield r'expenseCategory';
    yield serializers.serialize(
      object.expenseCategory,
      specifiedType: const FullType(ModelExpenseCategory),
    );
    yield r'expenseLocation';
    yield serializers.serialize(
      object.expenseLocation,
      specifiedType: const FullType(ModelExpenseLocation),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
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
    yield r'title';
    yield serializers.serialize(
      object.title,
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
    ModelExpenseSchedule object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ModelExpenseScheduleBuilder result,
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
        case r'expenseCategory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseCategory),
          ) as ModelExpenseCategory;
          result.expenseCategory.replace(valueDes);
          break;
        case r'expenseLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseLocation),
          ) as ModelExpenseLocation;
          result.expenseLocation.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
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
  ModelExpenseSchedule deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelExpenseScheduleBuilder();
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

