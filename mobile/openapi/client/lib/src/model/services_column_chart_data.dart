//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'services_column_chart_data.g.dart';

/// ServicesColumnChartData
///
/// Properties:
/// * [amount] 
/// * [month] 
@BuiltValue()
abstract class ServicesColumnChartData implements Built<ServicesColumnChartData, ServicesColumnChartDataBuilder> {
  @BuiltValueField(wireName: r'amount')
  int? get amount;

  @BuiltValueField(wireName: r'month')
  String? get month;

  ServicesColumnChartData._();

  factory ServicesColumnChartData([void updates(ServicesColumnChartDataBuilder b)]) = _$ServicesColumnChartData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ServicesColumnChartDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ServicesColumnChartData> get serializer => _$ServicesColumnChartDataSerializer();
}

class _$ServicesColumnChartDataSerializer implements PrimitiveSerializer<ServicesColumnChartData> {
  @override
  final Iterable<Type> types = const [ServicesColumnChartData, _$ServicesColumnChartData];

  @override
  final String wireName = r'ServicesColumnChartData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ServicesColumnChartData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(int),
      );
    }
    if (object.month != null) {
      yield r'month';
      yield serializers.serialize(
        object.month,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ServicesColumnChartData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ServicesColumnChartDataBuilder result,
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
  ServicesColumnChartData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServicesColumnChartDataBuilder();
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

