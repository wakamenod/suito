//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_location_req.g.dart';

/// UpdateExpenseLocationReq
///
/// Properties:
/// * [expenseLocation] 
@BuiltValue()
abstract class UpdateExpenseLocationReq implements Built<UpdateExpenseLocationReq, UpdateExpenseLocationReqBuilder> {
  @BuiltValueField(wireName: r'expenseLocation')
  ModelExpenseLocation get expenseLocation;

  UpdateExpenseLocationReq._();

  factory UpdateExpenseLocationReq([void updates(UpdateExpenseLocationReqBuilder b)]) = _$UpdateExpenseLocationReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseLocationReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseLocationReq> get serializer => _$UpdateExpenseLocationReqSerializer();
}

class _$UpdateExpenseLocationReqSerializer implements PrimitiveSerializer<UpdateExpenseLocationReq> {
  @override
  final Iterable<Type> types = const [UpdateExpenseLocationReq, _$UpdateExpenseLocationReq];

  @override
  final String wireName = r'UpdateExpenseLocationReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseLocationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseLocation';
    yield serializers.serialize(
      object.expenseLocation,
      specifiedType: const FullType(ModelExpenseLocation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateExpenseLocationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseLocationReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelExpenseLocation),
          ) as ModelExpenseLocation;
          result.expenseLocation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateExpenseLocationReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseLocationReqBuilder();
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

