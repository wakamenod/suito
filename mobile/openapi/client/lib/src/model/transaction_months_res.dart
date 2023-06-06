//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_months_res.g.dart';

/// TransactionMonthsRes
///
/// Properties:
/// * [yearMonths] 
@BuiltValue()
abstract class TransactionMonthsRes implements Built<TransactionMonthsRes, TransactionMonthsResBuilder> {
  @BuiltValueField(wireName: r'yearMonths')
  BuiltList<String> get yearMonths;

  TransactionMonthsRes._();

  factory TransactionMonthsRes([void updates(TransactionMonthsResBuilder b)]) = _$TransactionMonthsRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TransactionMonthsResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TransactionMonthsRes> get serializer => _$TransactionMonthsResSerializer();
}

class _$TransactionMonthsResSerializer implements PrimitiveSerializer<TransactionMonthsRes> {
  @override
  final Iterable<Type> types = const [TransactionMonthsRes, _$TransactionMonthsRes];

  @override
  final String wireName = r'TransactionMonthsRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TransactionMonthsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'yearMonths';
    yield serializers.serialize(
      object.yearMonths,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TransactionMonthsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TransactionMonthsResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'yearMonths':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.yearMonths.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TransactionMonthsRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransactionMonthsResBuilder();
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

