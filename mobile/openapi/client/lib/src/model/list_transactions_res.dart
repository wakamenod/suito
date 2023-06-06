//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/transaction.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_transactions_res.g.dart';

/// ListTransactionsRes
///
/// Properties:
/// * [transactions] 
@BuiltValue()
abstract class ListTransactionsRes implements Built<ListTransactionsRes, ListTransactionsResBuilder> {
  @BuiltValueField(wireName: r'transactions')
  BuiltList<Transaction> get transactions;

  ListTransactionsRes._();

  factory ListTransactionsRes([void updates(ListTransactionsResBuilder b)]) = _$ListTransactionsRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListTransactionsResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListTransactionsRes> get serializer => _$ListTransactionsResSerializer();
}

class _$ListTransactionsResSerializer implements PrimitiveSerializer<ListTransactionsRes> {
  @override
  final Iterable<Type> types = const [ListTransactionsRes, _$ListTransactionsRes];

  @override
  final String wireName = r'ListTransactionsRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListTransactionsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'transactions';
    yield serializers.serialize(
      object.transactions,
      specifiedType: const FullType(BuiltList, [FullType(Transaction)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListTransactionsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListTransactionsResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Transaction)]),
          ) as BuiltList<Transaction>;
          result.transactions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListTransactionsRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListTransactionsResBuilder();
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

