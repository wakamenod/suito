//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_expense_location_req.g.dart';

/// RegisterExpenseLocationReq
///
/// Properties:
/// * [expenseLocation] 
@BuiltValue()
abstract class RegisterExpenseLocationReq implements Built<RegisterExpenseLocationReq, RegisterExpenseLocationReqBuilder> {
  @BuiltValueField(wireName: r'expenseLocation')
  ModelExpenseLocation get expenseLocation;

  RegisterExpenseLocationReq._();

  factory RegisterExpenseLocationReq([void updates(RegisterExpenseLocationReqBuilder b)]) = _$RegisterExpenseLocationReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterExpenseLocationReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterExpenseLocationReq> get serializer => _$RegisterExpenseLocationReqSerializer();
}

class _$RegisterExpenseLocationReqSerializer implements PrimitiveSerializer<RegisterExpenseLocationReq> {
  @override
  final Iterable<Type> types = const [RegisterExpenseLocationReq, _$RegisterExpenseLocationReq];

  @override
  final String wireName = r'RegisterExpenseLocationReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterExpenseLocationReq object, {
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
    RegisterExpenseLocationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterExpenseLocationReqBuilder result,
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
  RegisterExpenseLocationReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterExpenseLocationReqBuilder();
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

