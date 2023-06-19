//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'column_chart_data.g.dart';

/// ColumnChartData
///
/// Properties:
/// * [amount] 
/// * [month] 
@BuiltValue()
abstract class ColumnChartData implements Built<ColumnChartData, ColumnChartDataBuilder> {
  @BuiltValueField(wireName: r'amount')
  int? get amount;

  @BuiltValueField(wireName: r'month')
  String get month;

  ColumnChartData._();

  factory ColumnChartData([void updates(ColumnChartDataBuilder b)]) = _$ColumnChartData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ColumnChartDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ColumnChartData> get serializer => _$ColumnChartDataSerializer();
}

class _$ColumnChartDataSerializer implements PrimitiveSerializer<ColumnChartData> {
  @override
  final Iterable<Type> types = const [ColumnChartData, _$ColumnChartData];

  @override
  final String wireName = r'ColumnChartData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ColumnChartData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(int),
      );
    }
    yield r'month';
    yield serializers.serialize(
      object.month,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ColumnChartData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ColumnChartDataBuilder result,
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
        case r'month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.month = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ColumnChartData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ColumnChartDataBuilder();
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

