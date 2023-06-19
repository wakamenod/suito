//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/pie_chart_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_pie_chart_data_res.g.dart';

/// GetPieChartDataRes
///
/// Properties:
/// * [categoryData] 
/// * [locationData] 
@BuiltValue()
abstract class GetPieChartDataRes implements Built<GetPieChartDataRes, GetPieChartDataResBuilder> {
  @BuiltValueField(wireName: r'categoryData')
  BuiltList<PieChartData> get categoryData;

  @BuiltValueField(wireName: r'locationData')
  BuiltList<PieChartData> get locationData;

  GetPieChartDataRes._();

  factory GetPieChartDataRes([void updates(GetPieChartDataResBuilder b)]) = _$GetPieChartDataRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetPieChartDataResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetPieChartDataRes> get serializer => _$GetPieChartDataResSerializer();
}

class _$GetPieChartDataResSerializer implements PrimitiveSerializer<GetPieChartDataRes> {
  @override
  final Iterable<Type> types = const [GetPieChartDataRes, _$GetPieChartDataRes];

  @override
  final String wireName = r'GetPieChartDataRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetPieChartDataRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'categoryData';
    yield serializers.serialize(
      object.categoryData,
      specifiedType: const FullType(BuiltList, [FullType(PieChartData)]),
    );
    yield r'locationData';
    yield serializers.serialize(
      object.locationData,
      specifiedType: const FullType(BuiltList, [FullType(PieChartData)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetPieChartDataRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetPieChartDataResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'categoryData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PieChartData)]),
          ) as BuiltList<PieChartData>;
          result.categoryData.replace(valueDes);
          break;
        case r'locationData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PieChartData)]),
          ) as BuiltList<PieChartData>;
          result.locationData.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetPieChartDataRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetPieChartDataResBuilder();
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

