//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/transactions_transaction.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transactions_list_transactions_res.g.dart';

/// TransactionsListTransactionsRes
///
/// Properties:
/// * [transactions] 
@BuiltValue()
abstract class TransactionsListTransactionsRes implements Built<TransactionsListTransactionsRes, TransactionsListTransactionsResBuilder> {
  @BuiltValueField(wireName: r'transactions')
  BuiltList<TransactionsTransaction> get transactions;

  TransactionsListTransactionsRes._();

  factory TransactionsListTransactionsRes([void updates(TransactionsListTransactionsResBuilder b)]) = _$TransactionsListTransactionsRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TransactionsListTransactionsResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TransactionsListTransactionsRes> get serializer => _$TransactionsListTransactionsResSerializer();
}

class _$TransactionsListTransactionsResSerializer implements PrimitiveSerializer<TransactionsListTransactionsRes> {
  @override
  final Iterable<Type> types = const [TransactionsListTransactionsRes, _$TransactionsListTransactionsRes];

  @override
  final String wireName = r'TransactionsListTransactionsRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TransactionsListTransactionsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'transactions';
    yield serializers.serialize(
      object.transactions,
      specifiedType: const FullType(BuiltList, [FullType(TransactionsTransaction)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TransactionsListTransactionsRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TransactionsListTransactionsResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TransactionsTransaction)]),
          ) as BuiltList<TransactionsTransaction>;
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
  TransactionsListTransactionsRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransactionsListTransactionsResBuilder();
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

